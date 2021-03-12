load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def antlr4_formatter():
    new_git_repository(
        name = "antlr4formatter",
        build_file_content = """
package(default_visibility = ["//visibility:public"])

load("@rules_java//java:defs.bzl", "java_binary", "java_library")

java_binary(
    name = "antlr4formatter",
    main_class = "com.khubla.antlr4formatter.StandaloneFormatter",
    resources = ["antlr4-formatter-standalone/src/main/resources/logback.xml"],
    runtime_deps = [
        ":antlr4formatter_lib",
        "@maven//:org_slf4j_slf4j_simple",
    ],
)

java_library(
    name = "antlr4formatter_lib",
    srcs = [
        "ANTLRv4Lexer.java",
        "ANTLRv4Parser.java",
        "ANTLRv4ParserBaseListener.java",
        "ANTLRv4ParserListener.java",
        "antlr4-formatter-standalone/src/main/java/com/khubla/antlr4formatter/StandaloneFormatter.java",
        "antlr4-formatter/src/main/java/com/khubla/antlr4formatter/Antlr4Formatter.java",
        "antlr4-formatter/src/main/java/com/khubla/antlr4formatter/Antlr4FormatterListenerImpl.java",
        "antlr4-formatter/src/main/java/com/khubla/antlr4formatter/Antlr4FormatterException.java",
        "antlr4-formatter/src/main/java/com/khubla/antlr4formatter/listener/FormatterListener.java",
        "antlr4-formatter/src/main/java/com/khubla/antlr4formatter/listener/FormatterParseTreeListenerImpl.java",
        "antlr4-formatter/src/main/java/org/antlr/parser/antlr4/LexerAdaptor.java",
    ],
    javacopts = ["-XepDisableAllChecks"],
    deps = [
        "@maven//:commons_cli_commons_cli",
        "@maven//:org_antlr_antlr4_runtime",
        "@maven//:org_slf4j_slf4j_api",
    ],
)

genrule(
    name = "antlr4formatter_generated",
    srcs = [
        "antlr4-formatter/src/main/antlr4/ANTLRv4Parser.g4",
        "antlr4-formatter/src/main/antlr4/ANTLRv4Lexer.g4",
        "antlr4-formatter/src/main/antlr4/LexUnicode.g4",
        "antlr4-formatter/src/main/antlr4/LexBasic.g4",
    ],
    outs = [
        "ANTLRv4Parser.java",
        "ANTLRv4Lexer.tokens",
        "ANTLRv4Lexer.java",
        "ANTLRv4ParserBaseListener.java",
        "ANTLRv4ParserListener.java",
    ],
    cmd = \"\"\"
java -cp $(location @antlr4_tool//jar) \\
    org.antlr.v4.Tool \\
    -Xexact-output-dir \\
       $(location antlr4-formatter/src/main/antlr4/ANTLRv4Parser.g4) \\
       $(location antlr4-formatter/src/main/antlr4/ANTLRv4Lexer.g4) \\
    -encoding UTF-8 \\
    -package org.antlr.parser.antlr4 \\
    -Werror \\
    -o $(@D)\"\"\",
    tools = ["@antlr4_tool//jar"],
)

    """,
        commit = "fc9f15fec73d1c60bf7440cf7a0a841cfc40f783",
        remote = "https://github.com/antlr/antlr4formatter",
        shallow_since = "1613418723 -0700",
        workspace_file_content = """
workspace(name = "antlr4formatter")
    """,
    )
