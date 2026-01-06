load("//yq:default.bzl", "YQ_DEFAULT_VERSION")
load("//yq:toolchain.bzl", "YQ_BINDIST", "yq_bindist_repo", "yq_bindist_toolchain_repo")

_toolchains_tag = tag_class(
    attrs = {
        "version": attr.string(),
    },
)

def _toolchains_impl(ctx):
    tag = None
    for mod in ctx.modules:
        for t in mod.tags.toolchains:
            tag = t

    version = tag.version if tag and tag.version else YQ_DEFAULT_VERSION
    if not YQ_BINDIST.get(version):
        fail("Binary distribution of yq {} is not available.".format(version))

    for os, checksum in YQ_BINDIST.get(version).items():
        bindist_name = "rules_yq_binary_{}".format(os)
        toolchain_name = bindist_name + "-toolchain"
        yq_bindist_repo(
            name = bindist_name,
            os = os,
            checksum = checksum,
            version = version,
        )
        yq_bindist_toolchain_repo(
            name = toolchain_name,
            bindist_name = bindist_name,
            os = os,
        )

toolchains = module_extension(
    implementation = _toolchains_impl,
    tag_classes = {"toolchains": _toolchains_tag},
)
