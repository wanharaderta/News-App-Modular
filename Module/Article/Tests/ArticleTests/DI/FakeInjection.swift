//
//  File.swift
//  
//
//  Created by Wanhar on 09/05/21.
//

import Foundation
import Article
import Core
import UIKit

final class FakeInjection: NSObject {
  func provideArticles<U: UseCase>() -> U where U.Request == String, U.Response == [ArticleModel] {
    let locale = FakeArticlesLocaleDataSourceImpl()
    let remote = FakeArticlesRemoteDataSource()
    let mapper = ArticlesTransformer()
    let repository = ArticlesRepository(
      localeDataSource: locale,
      remoteDataSource: remote,
      mapper: mapper)
    guard let interactor = Interactor(repository: repository) as? U else {
      fatalError(errorMessageInteractor)
    }
    return interactor
  }
}
