import PackageDescription

let package = Package(
    name: "RealDebridKit"
    dependencies: [
        .Package(url: "https://github.com/Alamofire/Alamofire", majorVersion: 4, minor: 2),
        .Package(url: "https://github.com/hkellaway/Gloss", majorVersion: 1, minor: 1),
    ]
)