//
//  ArticlesRouter.swift
//  News App Modular
//
//  Created by Wanhar on 09/05/21.
//

import Article
import SwiftUI

class ArticlesRouter {
  func makeDetailView(for article: ArticleModel) -> some View {
    return DetailView(article: article)
  }
}
