workspace(name = "rules_yq")

load("@rules_yq//yq:toolchain.bzl", "rules_yq_toolchains")

rules_yq_toolchains(version = "4.18.1")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "io_bazel_stardoc",
    remote = "https://github.com/bazelbuild/stardoc.git",
    commit = "4378e9b6bb2831de7143580594782f538f461180",
    shallow_since = "1570829166 -0400",
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")
stardoc_repositories()
