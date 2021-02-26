load(":default.bzl", "YQ_DEFAULT_VERSION")

YQ_BINDIST = {
    "4.6.1": {
        "linux" : "a339079fadf5e01d69067349b67db695db1a4f5046281713e35d9b6ca790b499",
        "mac": "de2f6ec457ac8cd021ead2c1cd64f1a84fa25dee8c77861fddcabc09e9aaf836",
        "windows": "b48326190c1072b7b7f6243e8610314836e7c13c92a1486b759d7f352c50a0d4",
    },
    "4.6.0": {
        "linux" : "3cd45de096cc3c5fcff3ba4b3fbc10cd2ad606c670b626b51f60ca66b7ddcd9a",
        "mac": "3203a4fe1e81d8f8ab04b2ddf294a9984951c8a170f7e33b3d447fb70ff3e82e",
        "windows": "290841f687a67e682eaafd6b51854246057c11738f59778096935d1aa10dfb35",
    },
    "4.5.1": {
        "linux" : "4995d892526fb83f13c424e4496acc047f8c2cccef340a7f7c97ea5a15a8802c",
        "mac": "df9d61376b0b2ef894f4b271684e4bbf6ab01054a2f645115f1ec2eac44f261e",
        "windows": "76603b55af22a565bdfd5180818515271fec10b8030318c054dc91c858308394",
    },
    "4.5.0": {
        "linux" : "b08830201aed3b75a32aebf29139877158904fe9efb05af628f43c239fb95830",
        "mac": "dcfc1e68a0e68de5b83721fb1c07d9cdd9b1f9d0687792206548ec3afea188ec",
        "windows": "1c8c09c18ddac814be7cfcb23b209aa3c6d5162c886973a3e1716d31588eb6ac",
    },
    "4.4.1": {
        "linux" : "42826789ba1f42ef9effd154090f48e7a944554163e83b5ac2e06ad5e775fabf",
        "mac": "48e156bc078b6664d1e59bab295241d05a0b4a48fbf54cc2788e3ac58ba99e0d",
        "windows": "2a4911f9690e9a5ec1ef4070b6071fe9853b0ba30c76c88e6fd50629adcd1399",
    },
    "4.4.0": {
        "linux" : "9d9d106b849b8d7c17a3e794adce902f9cd2fe9f2fa33e4351474f4a5950bc11",
        "mac": "4086f858e597b6d4a8034b6ba9ae4bae7bffe5f0c673cb7c2a586f0c9c322d2a",
        "windows": "5153242e4d9392b7770346a5bee6a5b6a3d7570dfe6696a76c9a23f056d17303",
    },
    "4.3.2": {
        "linux" : "8b6818ef69b3074da5352e7ade28b5e0577570c560f6797b8bd0b8cb2d838c97",
        "mac": "65bca3b48c5109860da67c34c721c91827aa0104bff0c3f44c0aa690b6ac075f",
        "windows": "f1a0d8ac55b0e2b88852502d805d735c272d4927e3d21020bd983b75ca516eee",
    },
    "4.3.1": {
        "linux" : "96d83b742cf348eee7c73b2c86d42ca80df431d3f7cf7172d51b11912e590717",
        "mac": "31d8c84a80f61210ff2fcef50a5b03c36ee5e3b22ed93f11233379471b3ea933",
        "windows": "25952c4d78ab61f4e37268fac3a5a651b39fd92e5ef61131771090a47fa78a96",
    },
    "4.3.0": {
        "linux" : "607540cbc413e5f6fe49109a176f238bf59be3977f60fd00af01352a53457f81",
        "mac": "1c40f5d6d02d7514930196c0dd6b5d3d73d811cfc847ca1081267f49b296aa89",
        "windows": "1a3d31ce1bd2ff002a57531f6c04c42bd39b5ba4a1be609b3dc6e5a6d9f88a55",
    },
    "4.2.1": {
        "linux" : "51018dedf4cb510c7cf6c42663327605e7e0c315747fe584fbf83cc10747449c",
        "mac": "9d84f133675164694039fc9072a322e3ec0c96444a68be38082ebc85ec11d55a",
        "windows": "d17497653f8f22f22c4cfd9de2277f8a66e9a29932061f5c8a45468c38399ca9",
    },
    "4.2.0": {
        "linux" : "5d44bd64e264e9029c5f06bcd960ba162d7ed7ddd1781f02a28d62f50577b632",
        "mac": "83b9dc96e75799e162035b2ee2dffc0c51de869c27a2e294eb0aee8653a19804",
        "windows": "74c633bcff2e275a6635248324df27ff2249efea3a8ce44c097f856c6c2027d9",
    },
    "4.1.0": {
        "linux" : "682f585b09b61e2fcf12d2e1c267414de7869d2e0ebcdd293d8d34388eb3dc82",
        "mac": "4184c1f8bac6097486bd269dcd41190f3776061c15c30d18631b7336d402df2a",
        "windows": "60bda4c60e0e21faa5389ca9d87165b7fde4b875073e3e15fccba66ec4332a25",
    },
    "4.0.0": {
        "linux" : "9d659ff92b657a8016a7936705ec71fdc4f950968a76a6f7e4c64e14d8adf801",
        "mac": "9fa9d4d42fa3477b2d172e4b2498124fc78c0bd6a98639eeb37ce2519912f484",
        "windows": "de8cda9cb338968f5187110f15efdcb5bfae4a3ab5988a77a30cf1c4159a47b2",
    },
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
    url = "https://github.com/mikefarah/yq/releases/download/v{}/{}".format(version, bin_name)
    if version in ["3.4.0", "3.4.1", "4.0.0"]:
        url = "https://github.com/mikefarah/yq/releases/download/{}/{}".format(version, bin_name)
    ctx.download(
        url = url,
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
yq_toolchain(name = "{os}_info", yq = ":yq-{os}", version = "{version}", os = "{os}")
        """.format(version = version, os = os),
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
        version = ctx.attr.version,
        os = ctx.attr.os,
    )]

yq_toolchain = rule(
    _yq_toolchain_impl,
    attrs = {
        "yq": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "version": attr.string(),
        "os": attr.string(),
    },
)
