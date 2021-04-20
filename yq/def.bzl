def _yq_replace_impl(ctx):
    if ctx.toolchains["@rules_yq//yq:toolchain"].os == "windows":
        fail("windows is not supported.")
    yq = ctx.toolchains["@rules_yq//yq:toolchain"].yq
    src_paths = []
    for src in ctx.files.srcs:
        src_paths.append(src.path)
    exec_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    template = ctx.file._v4_template
    if ctx.toolchains["@rules_yq//yq:toolchain"].version[0] == "3":
        template = ctx.file._v3_template
    ctx.actions.expand_template(
        template = template,
        output = exec_file,
        is_executable = True,
        substitutions = {
            "@@YQ_COMMAND@@": yq.path,
            "@@SRC_PATHS@@": ' '.join(src_paths),
            "@@YAML_KEY@@": ctx.attr.key,
            "@@YAML_VALUE@@": ctx.attr.value,
            "@@YAML_TAG@@": ctx.attr.tag,
        }
    )
    runfiles = ctx.runfiles(files = [yq])
    return [
        DefaultInfo(
            files = depset([exec_file]),
            runfiles = runfiles,
            executable = exec_file,
        )
    ]

yq_replace = rule(
    implementation = _yq_replace_impl,
    doc = """
Replace value with key on YAML file using yq

### Eexample

  ```
  yq_replace(
      name = "bumpup",
      key = "image.tag",
      value = "0123456789",
      srcs = glob(["values*.yaml"]),
  )
  ```
""",
    executable = True,
    attrs = {
        "key": attr.string(
            doc = "YAML key of value that want to replace by yq (join with '.')",
        ),
        "value": attr.string(
            doc = "set a value that is replace by yq",
        ),
        "tag": attr.string(
            default = "!!str",
            doc = "set type of value (default `!!str`), ref: https://mikefarah.gitbook.io/yq/usage/value-parsing#using-the-tag-flag-to-cast",
        ),
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
            doc = "target YAML files",
        ),
        "_v3_template": attr.label(
            allow_single_file = True,
            default = ":replace.v3.bash",
        ),
        "_v4_template": attr.label(
            allow_single_file = True,
            default = ":replace.v4.bash",
        ),
    },
    toolchains = [
        "@rules_yq//yq:toolchain",
    ],
)

def _setup_deps(deps):
    """Collects source files and import flags of transitive dependencies.
    Args:
      deps: List of deps labels from ctx.attr.deps.
    Returns:
      Returns a struct containing the following fields:
        transitive_sources: List of Files containing sources of transitive
            dependencies
    """
    transitive_sources = [dep.files for dep in deps]

    return struct(
        transitive_sources = depset(transitive = transitive_sources, order = "postorder"),
    )

def _yq_pretty_print_impl(ctx):
    yq = ctx.toolchains["@rules_yq//yq:toolchain"].yq
    depinfo = _setup_deps(ctx.attr.deps)
    sources = depset(ctx.files.srcs, transitive = [depinfo.transitive_sources])
    compile_inputs = ctx.files.srcs + depinfo.transitive_sources.to_list()
    outputs = [ctx.outputs.out]
    output_path = ctx.outputs.out.path
    if ctx.toolchains["@rules_yq//yq:toolchain"].version[0] == "4":
        command = [yq.path] + ["eval -P"] + [f.path for f in sources.to_list()] + ["> " + output_path]
    else:
        command = [yq.path] + ["r"] + [f.path for f in sources.to_list()] + ["w " + output_path]

    ctx.actions.run_shell(
        inputs = compile_inputs,
        tools = [yq],
        outputs = outputs,
        mnemonic = "yq",
        command = " ".join(command),
        use_default_shell_env = True,
        progress_message = "Pretty-printing using yq for " + ctx.label.name,
    )

yq_pretty_print = rule(
    implementation = _yq_pretty_print_impl,
    doc = """
Pretty-print a YAML file using yq

### Example

  ```
  yq_pretty_print(
      name = "foo",
      deps = [":foo_json"],
      out = "bar.yml",
  )
  ```
""",
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = False,
            doc = "target YAML files",
        ),
        "out": attr.output(
            mandatory = True,
            doc = "output YAML file",
        ),
        "deps": attr.label_list(
            allow_files = False,
            providers = [DefaultInfo],
        ),
    },
    toolchains = [
        "@rules_yq//yq:toolchain",
    ],
)
