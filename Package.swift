// swift-tools-version: 5.10
//
// SPDX-License-Identifier: Unicode-3.0
// Copyright Contributors to the ICU project
import PackageDescription

let package = Package(
  name: "icu",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v17),
    .watchOS(.v10)
  ],
  products: [
    .library(
      name: "icuuc",
      targets: ["icuuc"]
    ),
    .library(
      name: "icuin",
      targets: ["icuin"]
    ),
    .executable(
      name: "TestUnicode",
      targets: ["TestUnicode"]
    ),
  ],
  targets: [
    .target(
      name: "icuuc",
      publicHeadersPath: ".",
      cxxSettings: [
        .define("U_COMMON_IMPLEMENTATION"),
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
        .define("_ALLOW_KEYWORD_MACROS", to: "1", .when(platforms: [.windows])),
        .define("static_assert(_conditional, ...)", to: "", .when(platforms: [.windows])),
      ]
    ),

    .target(
      name: "icuin",
      dependencies: [
        .target(name: "icuuc")
      ],
      publicHeadersPath: ".",
      cxxSettings: [
        .define("U_I18N_IMPLEMENTATION"),
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
        .define("_ALLOW_KEYWORD_MACROS", to: "1", .when(platforms: [.windows])),
        .define("static_assert(_conditional, ...)", to: "", .when(platforms: [.windows])),
      ],
      linkerSettings: [
        .linkedLibrary("advapi32", .when(platforms: [.windows]))
      ]
    ),

    .executableTarget(
      name: "TestUnicode",
      dependencies: [
        .target(name: "icuin")
      ],
      cxxSettings: [
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
        .define("_ALLOW_KEYWORD_MACROS", to: "1", .when(platforms: [.windows])),
        .define("static_assert(_conditional, ...)", to: "", .when(platforms: [.windows])), 
      ],
      swiftSettings: [
        .interoperabilityMode(.Cxx)
      ]
    ),
  ],
  cxxLanguageStandard: .cxx17
)
