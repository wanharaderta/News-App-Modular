import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(ArticlesRepositoryTest.allTests),
    testCase(ArticlesPresenterTest.allTests)
  ]
}
#endif
