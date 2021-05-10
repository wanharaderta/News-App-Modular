//
//  File.swift
//  
//
//  Created by Wanhar on 07/05/21.
//

import Foundation
import Combine
import Core

public struct ArticlesRepository<
  ArticlesLocaleDataSourceImpl: ArticlesLocaleDataSource,
  ArticlesRemoteDataSource: DataSource,
  Transformer: ArticlesMapper> : Repository
where
  ArticlesLocaleDataSourceImpl.Response == ArticleEntity,
  ArticlesRemoteDataSource.Response == [ArticleResponse],
  Transformer.Response == [ArticleResponse],
  Transformer.Entity == [ArticleEntity],
  Transformer.Domain == [ArticleModel] {
  
  public typealias Request = String
  public typealias Response = [ArticleModel]
  
  private let _locale: ArticlesLocaleDataSourceImpl
  private let _remote: ArticlesRemoteDataSource
  private let _mapper: Transformer
  
  public init(
    localeDataSource: ArticlesLocaleDataSourceImpl,
    remoteDataSource: ArticlesRemoteDataSource,
    mapper: Transformer
  ) {
    _locale = localeDataSource
    _remote = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: String?) -> AnyPublisher<[ArticleModel], Error> {
    return _locale.list(request: nil)
      .flatMap { result -> AnyPublisher<[ArticleModel], Error> in
        if result.isEmpty {
          return self._remote.execute(request: nil)
            .map { _mapper.transformResponseToEntity(response: $0) }
            .flatMap { self._locale.add(entities: $0)}
            //.filter { $0 }
            .flatMap {_ in self._locale.list(request: nil)
              .map { _mapper.transformEntitiesToDomain(entities: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return _locale.list(request: nil)
            .map { _mapper.transformEntitiesToDomain(entities: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
}
