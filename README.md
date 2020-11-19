# Bazel Rules for yq

this repository is bazel rules for [yq](https://github.com/mikefarah/yq).

## Rules

- yq_replace

## Example

```
load("@rules_yq//yq:def.bzl", "yq_replace")

yq_replace(
    name = "bumpup",
    key = "image.tag",
    value = "0123456789",
    srcs = glob(["values*.yaml"]),
)
```
