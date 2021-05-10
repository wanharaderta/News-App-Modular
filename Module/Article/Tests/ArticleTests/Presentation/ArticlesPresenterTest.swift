//
//  File.swift
//  
//
//  Created by Wanhar on 08/05/21.
//

import Core
import XCTest
@testable import Article

final class ArticlesPresenterTest: XCTestCase {
  
  private var articlesUseCase: FakeArticlesInteractor!
  private var presenter: ArticlesPresenter<FakeArticlesInteractor>!
  
  override func setUp() {
    articlesUseCase = FakeInjection.init().provideArticles()
    presenter =  ArticlesPresenter(articlesUseCase: articlesUseCase)
  }
  
  func testPropertyPresenter() {
    XCTAssertFalse(presenter.isLoading)
    XCTAssertEqual(presenter.errorMessage, "")
    XCTAssertTrue(presenter.articles.isEmpty)
  }
  
  func testGetArticles() {
    presenter.getArticles()
    XCTAssertTrue(presenter.isLoading)
    XCTAssertEqual(presenter.errorMessage, "")
    XCTAssertNotNil(presenter.articles)
  }
  
  static var allTests = [
    ("testPropertyPresenter", testPropertyPresenter),
    ("testGetArticles", testGetArticles)
  ]
  
}
