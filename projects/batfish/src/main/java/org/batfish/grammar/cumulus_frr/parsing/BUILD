package(default_visibility = ["//visibility:public"])

java_library(
    name = "cumulus_frr_base",
    srcs = [
        ":CumulusFrrBaseLexer.java",
        ":CumulusFrrBaseParser.java",
    ],
    deps = [
        "//projects/batfish-common-protocol:parser_common",
        "@maven//:com_google_guava_guava",
        "@maven//:org_antlr_antlr4_runtime",
    ],
)
