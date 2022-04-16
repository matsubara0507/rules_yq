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

## Supported versions:
- 4.24.5
- 4.23.1
- 4.22.1
- 4.21.1
- 4.20.2
- 4.19.1
- 4.18.1
- 4.17.2
- 4.16.2
- 4.15.1
- 4.14.2
- 4.13.5
- 4.12.0
- 4.11.2
- 4.10.0
- 4.9.8
- 4.8.0
- 4.7.1
- 4.6.1
- 4.6.0
- 4.5.1
- 4.5.0
- 4.4.1
- 4.4.0
- 4.3.2
- 4.3.1
- 4.3.0
- 4.2.1
- 4.2.0
- 4.1.0
- 4.0.0
- 3.4.1
- 3.4.0
