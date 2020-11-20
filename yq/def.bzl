def _yq_replace_impl(ctx):
    yq = ctx.toolchains["@rules_yq//yq:toolchain"].yq
    os = ctx.toolchains["@rules_yq//yq:toolchain"].os

    src_paths = []
    for src in ctx.files.srcs:
        src_paths.append(src.path)

    template = ctx.file._template
    script_name = ctx.label.name + ".bash"
    if os == "windows":
        template = ctx.file._windows_template
        script_name = ctx.label.name + ".bat"

    exec_file = ctx.actions.declare_file(script_name)
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
        },
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
    _yq_replace_impl,
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
        "_template": attr.label(
            allow_single_file = True,
            default = ":replace.bash",
        ),
        "_windows_template": attr.label(
            allow_single_file = True,
            default = ":replace.bat",
        )
    },
    toolchains = [
        "@rules_yq//yq:toolchain",
    ],
)

def _yq_help_impl(ctx):
    yq = ctx.toolchains["@rules_yq//yq:toolchain"].yq
    output = ctx.actions.declare_file("help_dump")
    ctx.actions.run_shell(
        command = "{} --help > {}".format(yq.path, output.path),
        inputs = [yq],
        outputs = [output],
    )
    return [DefaultInfo(files = depset([output]))]

yq_help = rule(
    _yq_help_impl,
    attrs = {
        "arguments": attr.string_list(default = []),
    },
    toolchains = [
        "@rules_yq//yq:toolchain",
    ],
)
