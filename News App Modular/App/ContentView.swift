//
//  ContentView.swift
//  News App Modular
//
//  Created by Wanhar on 07/05/21.
//

import SwiftUI
import Article
import Core

struct ContentView: View {
  
  @EnvironmentObject var articlesPresenter: ArticlesPresenter<ArticlesInteractor>
  
    var body: some View {
       ArticlesView(presenter: articlesPresenter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
