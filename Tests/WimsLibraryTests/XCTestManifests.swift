import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(WimsLibraryTests.allTests),
    ]
}
#endif
