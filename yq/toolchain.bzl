load(":default.bzl", "YQ_DEFAULT_VERSION")

YQ_BINDIST = {
    "3.4.1": {
        "linux" : "adbc6dd027607718ac74ceac15f74115ac1f3caef68babfb73246929d4ffb23c",
        "mac": "5553d4640550debed5213a5eb6016d3a3485ca8a36e9c71996610280755d5a50",
        "windows": "987d31d3a9b75f9cb0f202173aab033d333d2406ba2caa7dba9d16a5204c2167",
    },
    "3.4.0": {
        "linux" : "f6bd1536a743ab170b35c94ed4c7c4479763356bd543af5d391122f4af852460",
        "mac": "f93a7772c9686713fb62066cf96a045ff3dc827575174b261a7ccd9d39a014fe",
        "windows": "298484971d58f4966b10b223f66b329d88bb20e8194e903ed2a847ae887bcdad",
    },
}

def _yq_bindist_impl(ctx):
    os = ctx.attr.os
    bin_name = {
        "linux": "yq_linux_amd64",
        "mac": "yq_darwin_amd64",
        "windows": "yq_windows_amd64.exe",
    }.get(os)
    version = ctx.attr.version
    ctx.download(
        url = "https://github.com/mikefarah/yq/releases/download/{}/{}".format(version, bin_name),
        sha256 = ctx.attr.checksum,
        output = "yq-{}".format(os),
        executable = True,
    )
    ctx.file(
        "BUILD",
        executable = False,
        content = """
load("@rules_yq//yq:toolchain.bzl", "yq_toolchain")
exports_files(["yq-{os}"])
yq_toolchain(name = "{os}_info", yq = ":yq-{os}", os = "{os}")
        """.format(os = os),
    )

_yq_bindist = repository_rule(
    _yq_bindist_impl,
    attrs = {
        "os": attr.string(),
        "checksum": attr.string(),
        "version": attr.string(),
    }
)

def _yq_bindist_toolchain_impl(ctx):
    exec_constraints = [{
        "linux": "@platforms//os:linux",
        "mac": "@platforms//os:osx",
        "windows": "@platforms//os:windows",
    }.get(ctx.attr.os)]
    ctx.file(
        "BUILD",
        executable = False,
        content = """
toolchain(
    name = "toolchain",
    toolchain_type = "@rules_yq//yq:toolchain",
    toolchain = "@{bindist_name}//:{os}_info",
    exec_compatible_with = {exec_constraints},
    target_compatible_with = {target_constraints},
)
        """.format(
            os = ctx.attr.os,
            bindist_name = ctx.attr.bindist_name,
            exec_constraints = exec_constraints,
            target_constraints = exec_constraints,
        ),
    )

_yq_bindist_toolchain = repository_rule(
    _yq_bindist_toolchain_impl,
    local = False,
    attrs = {
        "bindist_name": attr.string(),
        "os": attr.string(),
    },
)

def register_yq_toolchain(version, os, checksum):
    """Register yq binary as toolchain

    Args:
      version: version of yq binary
      os: platform (linux, mac or windows)
      checksum: sha256 checkusum for https://github.com/mikefarah/yq/releases/download/{version}/{binary_name}
    """
    bindist_name = "rules_yq_binary_{}".format(os)
    toolchain_name = bindist_name + "-toolchain"
    _yq_bindist(name = bindist_name, os = os, checksum = checksum, version = version)
    _yq_bindist_toolchain(name = toolchain_name, bindist_name = bindist_name, os = os)
    native.register_toolchains("@{}//:toolchain".format(toolchain_name))

def rules_yq_toolchains(version = YQ_DEFAULT_VERSION):
    """Register yq binary that specified version for all platforms as toolchains."""
    if not YQ_BINDIST.get(version):
        fail("Binary distribution of yq {} is not available.".format(version))
    for os, checksum in YQ_BINDIST.get(version).items():
        register_yq_toolchain(version = version, os = os, checksum = checksum)


def _yq_toolchain_impl(ctx):
    return [platform_common.ToolchainInfo(
        yq = ctx.file.yq,
        os = ctx.attr.os,
    )]

yq_toolchain = rule(
    _yq_toolchain_impl,
    attrs = {
        "yq": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "os": attr.string(),
    },
)
