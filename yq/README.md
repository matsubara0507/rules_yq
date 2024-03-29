<!-- Generated with Stardoc: http://skydoc.bazel.build -->

<a name="#yq_pretty_print"></a>

## yq_pretty_print

<pre>
yq_pretty_print(<a href="#yq_pretty_print-name">name</a>, <a href="#yq_pretty_print-deps">deps</a>, <a href="#yq_pretty_print-out">out</a>, <a href="#yq_pretty_print-srcs">srcs</a>)
</pre>


Pretty-print a YAML file using yq

### Example

  ```
  yq_pretty_print(
      name = "foo",
      deps = [":foo_json"],
      out = "bar.yml",
  )
  ```


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| deps |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| out |  output YAML file   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |
| srcs |  target YAML files   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |


<a name="#yq_replace"></a>

## yq_replace

<pre>
yq_replace(<a href="#yq_replace-name">name</a>, <a href="#yq_replace-key">key</a>, <a href="#yq_replace-srcs">srcs</a>, <a href="#yq_replace-tag">tag</a>, <a href="#yq_replace-value">value</a>)
</pre>


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


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| key |  YAML key of value that want to replace by yq (join with '.')   | String | optional | "" |
| srcs |  target YAML files   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |
| tag |  set type of value (default <code>!!str</code>), ref: https://mikefarah.gitbook.io/yq/usage/value-parsing#using-the-tag-flag-to-cast   | String | optional | "!!str" |
| value |  set a value that is replace by yq   | String | optional | "" |


