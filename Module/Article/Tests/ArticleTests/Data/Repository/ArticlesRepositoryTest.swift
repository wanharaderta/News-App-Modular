//
//  File.swift
//  
//
//  Created by Wanhar on 09/05/21.
//
import Foundation
import XCTest
import Combine
import Core
@testable import Article

final class ArticlesRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var articlesUseCase: FakeArticlesInteractor = FakeInjection.init().provideArticles()
  
  override func setUp() {
    cancellables = []
    articlesUseCase = FakeInjection.init().provideArticles()
  }
  
  func testExecuteGetAllArticle() {
    articlesUseCase.execute(request: "")
      .sink(receiveCompletion: { (completion) in
        switch completion {
        case .failure(let error):
          print("Failure with error: \(error.localizedDescription)")
        case .finished:
          print("Finished ⚡️")
        }
      }, receiveValue: { (results) in
        XCTAssertNotNil(results)
        XCTAssertTrue(results.count == 1)
      })
      .store(in: &cancellables)
  }
  
  static var allTests = [
    ("testExecuteGetAllArticle", testExecuteGetAllArticle)
  ]
  
  override func tearDown() {
    cancellables = []
  }
}
