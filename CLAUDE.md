# CLAUDE.md - iOSSandbox Project Guidelines

## Build & Test Commands
- Build project: `xcodebuild -project iOSSandbox.xcodeproj -scheme iOSSandbox build`
- Run all tests: `xcodebuild test -destination 'platform=iOS Simulator,name=iPhone 15,OS=18.1' -scheme iOSSandbox -project /Users/hisashi/work/iOSSandbox/iOSSandbox.xcodeproj`
- Run specific test: `xcodebuild -project iOSSandbox.xcodeproj -scheme iOSSandbox test -only-testing:MyLibraryTests/MyLibraryTests/testExample`
- Package tests: `swift test --filter MyLibraryTests.testExample`

## Code Style Guidelines
- **Imports**: Foundation first, then UIKit/SwiftUI, then third-party libraries (Alamofire)
- **Indentation**: 4 spaces
- **Types**: Use structs for value types, classes for reference types
- **Naming**: camelCase for variables/functions, PascalCase for types
- **Documentation**: Comment public methods and error-prone sections
- **Error Handling**: Use fatalError for unimplemented required initializers
- **Line Length**: Keep lines under 120 characters
- **File Organization**: Group related properties and methods together

## Project Structure
- Swift Package with multiple targets (MyLibrary, TextWithLink, Component, etc.)
- Uses both SwiftUI and UIKit
- iOS 16+ target
- Swift 6 compliant