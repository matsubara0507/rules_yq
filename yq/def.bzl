def _yq_replace_impl(ctx):
    yq = ctx.toolchains["@rules_yq//yq:toolchain"].yq
    src_paths = []
    for src in ctx.files.srcs:
        src_paths.append(src.path)
    exec_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    ctx.actions.expand_template(
        template = ctx.file._template,
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
    executable = True,
    attrs = {
        "key": attr.string(),
        "value": attr.string(),
        "tag": attr.string(
            default = "!!str"
        ),
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
        ),
        "_template": attr.label(
            allow_single_file = True,
            default = ":replace.bash",
        ),
    },
    toolchains = [
        "@rules_yq//yq:toolchain",
    ]
)
