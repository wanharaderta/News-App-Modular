//
//  File.swift
//  
//
//  Created by Wanhar on 09/05/21.
//

import Foundation
import Combine
import RealmSwift
import Article
import Core

struct FakeArticlesLocaleDataSourceImpl: ArticlesLocaleDataSource {
  public typealias Request = String
  public typealias Response = ArticleEntity
  
  public func list(request: String?) -> AnyPublisher<[ArticleEntity], Error> {
    return Future<[ArticleEntity], Error> { completion in
      let articleEntities = ArticlesTransformer().transformResponseToEntity(response: ArticleResponse.mockArticles)
      completion(.success(articleEntities))
    }.eraseToAnyPublisher()
  }
  
  public func add(entities: [ArticleEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      completion(.success(true))
    }.eraseToAnyPublisher()
  }
}
