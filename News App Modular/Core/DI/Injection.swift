//
//  Injection.swift
//  News App Modular
//
//  Created by Wanhar on 07/05/21.
//

import Foundation

final class Injection: NSObject {
  func provideArticles<U: UseCase>() -> U where U.Request == String, U.Response == [ArticleModel] {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
         fatalError(errorMessageDelegate)
    }
    let locale = ArticlesLocaleDataSourceImpl(realm: appDelegate.realm)
    let remote = ArticlesRemoteDataSource(endpoint: Endpoints.Gets.news.url)
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
