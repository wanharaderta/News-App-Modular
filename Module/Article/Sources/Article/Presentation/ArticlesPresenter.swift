//
//  File.swift
//  
//
//  Created by Wanhar on 08/05/21.
//

import Foundation
import Core
import Combine

public class ArticlesPresenter<ArticlesUseCase: UseCase>: ObservableObject
where ArticlesUseCase.Request == String, ArticlesUseCase.Response == [ArticleModel] {
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let articlesUseCase: ArticlesUseCase
  
  @Published public var articles: [ArticleModel] = []
  @Published public var articlesTemp: [ArticleModel] = []
  @Published public var searchTemp: String = ""
  @Published public var errorMessage: String = ""
  @Published public var currentDate: String = ""
  @Published public var isLoading: Bool = false
 
  
  public init(articlesUseCase: ArticlesUseCase) {
    self.articlesUseCase = articlesUseCase
  }
  
  public func getArticles() {
    isLoading = true
    articlesUseCase.execute(request: "")
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { articles in
        self.articles = articles
        self.articlesTemp = articles
      }).store(in: &cancellables)
  }
}
