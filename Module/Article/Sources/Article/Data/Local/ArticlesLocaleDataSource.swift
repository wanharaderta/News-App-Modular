//
//  File.swift
//  
//
//  Created by Wanhar on 07/05/21.
//

import Foundation
import Core
import RealmSwift
import Combine

public protocol ArticlesLocaleDataSource: LocaleDataSource {
  func list(request: Request?) -> AnyPublisher<[Response], Error>
  func add(entities: [Response]) -> AnyPublisher<Bool, Error>
}

public struct ArticlesLocaleDataSourceImpl: ArticlesLocaleDataSource {
  public typealias Request = String
  public typealias Response = ArticleEntity
  
  private let _realm: Realm
  
  public init(realm: Realm) {
    _realm = realm
  }
  
  public func list(request: String?) -> AnyPublisher<[ArticleEntity], Error> {
    return Future<[ArticleEntity], Error> { completion in
      let articleEntities = {
        _realm.objects(ArticleEntity.self)
      }()
      completion(.success(articleEntities.toArray(ofType: ArticleEntity.self)))
    }.eraseToAnyPublisher()
  }
  
  public func add(entities: [ArticleEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
        do {
            try _realm.write {
                for meal in entities {
                    _realm.add(meal, update: .all)
                }
                completion(.success(true))
            }
        } catch {
            completion(.failure(DatabaseError.requestFailed))
        }
        
    }.eraseToAnyPublisher()
  }
}
