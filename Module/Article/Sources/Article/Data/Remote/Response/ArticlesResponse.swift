//
//  File.swift
//  
//
//  Created by Wanhar on 07/05/21.
//

import Foundation

public struct ArticlesResponse: Decodable {
  
  let articles: [ArticleResponse]
  
  private enum CodingKeys: String, CodingKey {
    case articles
  }
}

public struct ArticleResponse: Decodable {
  var id =          UUID().uuidString
  let source:       Source?
  let author:       String?
  let title:        String?
  let description:  String?
  let url:          String?
  let urlToImage:   String?
  let publishedAt:  String?
  let content:      String?
  private enum CodingKeys: String, CodingKey {
    case source
    case author
    case title
    case description
    case url
    case urlToImage
    case publishedAt
    case content
  }
}

public struct Source: Decodable {
  let name: String?
}

extension ArticleResponse {

  public static var mockArticles: [ArticleResponse] {
    return [ArticleResponse.mockArticle]
  }
  
  public static var mockArticle: ArticleResponse {
    ArticleResponse(
      source: nil,
      author: "mock author",
      title: "mock title",
      description: "mock description",
      url: "mock url",
      urlToImage: "mock urlToImage",
      publishedAt: "mock publishedAt",
      content: "mock content")
  }
}
