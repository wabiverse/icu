<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

<div align="center">

<h1 align="center">
    International Components for Unicode
</h1>

<p align="center">
  <i align="center">Intended for <b>windows users</b>, to bring <b>unicode support</b> in the form of a <b>swift</b> package for the <a href="https://github.com/unicode-org/icu"><b>icu project</b></a>.</i>
</p>

</div>

<div align="center">

### Usage

</div>

##### To use zlib in swift, add zlib as a package dependency in your project's Package.swift file.
```swift
dependencies: [
  .package(url: "https://github.com/wabiverse/icu.git", from: "76.1.0"),
]
```


##### Then, for any target you'd like, add the zlib product as a target dependency, a complete example.
```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "MyPackage",
  products: [
    .library(
      name: "MyLibrary",
      targets: ["MyLibrary"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/wabiverse/icu.git", from: "76.1.0")
  ],
  targets: [
    .target(
      name: "MyLibrary",
      dependencies: [
        /* add the icu product as a library dependency. */
        .product(name: "icuin", package: "icu"),
      ]
    ),
  ]
)
```

<br>

<hr/>

###### icu is licensed under the terms of the [Unicode License v3](https://github.com/unicode-org/icu/blob/main/LICENSE).
