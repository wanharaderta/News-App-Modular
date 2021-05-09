//
//  ArticlesView.swift
//  News App Modular
//
//  Created by Wanhar on 07/05/21.
//

import SwiftUI
import Article
import Core

struct ArticlesView: View {
  
  @ObservedObject var presenter: ArticlesPresenter<ArticlesInteractor>
  @State private var articleSelected: ArticleModel? = nil
  
  var body: some View {
    return VStack {
      ScrollView(.vertical, showsIndicators: false, content: {
        VStack {
          Text("Browse News")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 30)
          
          ZStack {
            VStack {
              if presenter.isLoading {
                VStack {
                  Text("Loading...")
                  ActivityIndicator()
                }
              } else {
                if self.presenter.articles.isEmpty {
                  Spacer()
                  HStack {
                    Spacer()
                    VStack {
                      Image("news")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                      Text("News not available")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                      Button("Refresh") {self.presenter.getArticles()}
                        .padding(7)
                        .foregroundColor(.white)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(15)
                        .frame(width: 100)
                      
                    }
                    Spacer()
                  }
                  Spacer()
                } else {
                  VStack {
                    ForEach(self.presenter.articles, id: \.id) { item in
                      ArticleRow(item: item).onTapGesture {
                        self.articleSelected = item
                      }
                    }
                  }.padding(.bottom, 120)
                }
              }
            }
            .padding(.top, 15)
          }.onAppear {
            if self.presenter.articles.isEmpty {
              self.presenter.getArticles()
            }
          }
        }.padding()
      })
    }.sheet(item: $articleSelected) { item in
      self.detailLinkBuilder(for: item)
    }
    .background(Color.white)
  }
}

extension ArticlesView {
  func detailLinkBuilder(
    for article: ArticleModel
  ) -> some View {
    return ArticlesRouter().makeDetailView(for: article)
  }
}
