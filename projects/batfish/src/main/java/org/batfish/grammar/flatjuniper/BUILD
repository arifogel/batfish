package(default_visibility = ["//visibility:public"])

load("@batfish//skylark:pmd_test.bzl", "pmd_test")

java_library(
    name = "flatjuniper",
    srcs = glob(
        ["*.java"],
        exclude = ["BUILD"],
    ),
    deps = [
        "//projects/batfish-common-protocol:common",
        "//projects/batfish/src/main/antlr4/org/batfish/grammar/flatjuniper",
        "//projects/batfish/src/main/java/org/batfish/representation/juniper",
        "@maven//:com_google_code_findbugs_jsr305",
        "@maven//:com_google_guava_guava",
        "@maven//:io_opentracing_opentracing_api",
        "@maven//:io_opentracing_opentracing_util",
        "@maven//:org_antlr_antlr4_runtime",
        "@maven//:org_apache_commons_commons_lang3",
    ],
)

pmd_test(
    name = "pmd",
    lib = ":flatjuniper",
)
