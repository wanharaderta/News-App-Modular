//
//  File.swift
//  
//
//  Created by Wanhar on 07/05/21.
//

import Foundation
import Core

public protocol ArticlesMapper: Mapper {
  func transformResponseToDomain(response: Response) -> Domain
  func transformEntitiesToDomain(entities: Entity) -> Domain
  func transformResponseToEntity(response: Response) -> Entity
}

public struct ArticlesTransformer: ArticlesMapper {
   
  public typealias Response = [ArticleResponse]
  public typealias Entity = [ArticleEntity]
  public typealias Domain = [ArticleModel]
   
  public init() {}
   
  public func transformResponseToDomain(response: [ArticleResponse]) -> [ArticleModel] {
    return response.map { result in
      return ArticleModel(
        id: result.id,
        author: result.author ?? "",
        sourceName: result.source?.name ?? "",
        title: result.title ?? "",
        urlToImage: result.urlToImage ?? "",
        content: result.content ?? "",
        description: result.description ?? "")
    }
  }
  
  public func transformEntitiesToDomain(entities: [ArticleEntity]) -> [ArticleModel] {
    return entities.map { result in
      return ArticleModel(
        id: result.itemId,
        author: result.author,
        sourceName: result.sourceName,
        title: result.title,
        urlToImage: result.urlToImage,
        content: result.content,
        description: result.desc)
    }
  }
  
  public func transformResponseToEntity(response: [ArticleResponse]) -> [ArticleEntity] {
    return response.map { result in
      transformResponseToEntity(response: result)
    }
  }

  func transformResponseToEntity(response : ArticleResponse) -> ArticleEntity {
    let articleEntity = ArticleEntity()
    articleEntity.itemId = response.id
    articleEntity.author = response.author ?? ""
    articleEntity.sourceName = response.source?.name ?? ""
    articleEntity.title = response.title ?? ""
    articleEntity.urlToImage = response.urlToImage ?? ""
    articleEntity.content = response.content ?? ""
    articleEntity.desc = response.description ?? ""
    return articleEntity
  }
}
