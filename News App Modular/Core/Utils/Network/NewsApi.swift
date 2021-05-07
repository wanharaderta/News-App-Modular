//
//  NewsApi.swift
//  News App Modular
//
//  Created by Wanhar on 07/05/21.
//

import Foundation

struct API {
  static let baseUrl = "https://newsapi.org/v2/top-headlines?country=id"
}

protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  enum Gets: Endpoint {
    case news
    public var url: String {
      switch self {
      case .news: return "\(API.baseUrl)&category=technology&apiKey=74231bbed0db4b088bf4b82599488bb2"
      }
    }
  }
}
