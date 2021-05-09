//
//  File.swift
//  
//
//  Created by Wanhar on 07/05/21.
//

import Foundation

public struct ArticleModel: Equatable, Identifiable {
  
  public let id: String
  public let author: String
  public let sourceName: String
  public let title: String
  public let urlToImage: String
  public let content: String
  public let description: String
  
  public init(
    id: String,
    author: String,
    sourceName: String,
    title: String,
    urlToImage: String,
    content: String,
    description: String
  ){
    self.id = id
    self.author = author
    self.sourceName = sourceName
    self.title = title
    self.urlToImage = urlToImage
    self.content = content
    self.description = description
  }
}

extension ArticleModel {
  public static var mockArticle: ArticleModel {
    return ArticleModel(
      id: "1",
      author: "www.google.com",
      sourceName: "Google",
      title: "News",
      urlToImage: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
      content: "Lorem example",
      description: "Lorem example"
      )
  }
}

