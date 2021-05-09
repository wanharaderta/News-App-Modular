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

struct FakeArticlesRemoteDataSource: DataSource {
  
  public typealias Request = String
  public typealias Response = [ArticleResponse]
  
  public func execute(request: String?) -> AnyPublisher<[ArticleResponse], Error> {
    return Future<[ArticleResponse], Error> { completion in
      completion(.success(ArticleResponse.mockArticles))
    }.eraseToAnyPublisher()
  }
}
