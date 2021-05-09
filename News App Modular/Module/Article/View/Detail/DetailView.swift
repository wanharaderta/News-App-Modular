//
//  DetailView.swift
//  News App Modular
//
//  Created by Wanhar on 09/05/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Article
import Core

struct DetailView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var article: ArticleModel
  
  var body: some View {
    VStack {
      ZStack(alignment: .top) {
        ScrollView(.vertical, showsIndicators: false) {
          ZStack(alignment: .top) {
            WebImage(url: URL(string: self.article.urlToImage))
              .resizable()
              .frame(height: 320)
            HStack {
              Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "arrow.left")
                  .foregroundColor(.white)
                  .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 12)
                  .background(Color.black.opacity(0.3))
                  .clipShape(Circle())
              }
              .padding(.leading, 10)
              .padding(.top, 25)
              Spacer()
            }
          }
          HStack {
            Text( self.article.title)
              .font(.title2)
              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
          }.padding(.horizontal, 25)
          .padding(.top, 25)
          
          HStack {
            VStack(alignment: .leading) {
              HStack {
                Text("Description").font(.headline)
                Spacer()
              }
              Text("\( self.article.description) \( self.article.content)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .padding(.top, 10)
            }
          }.padding(.horizontal, 25)
          .padding(.top, 20)
          HStack {
            VStack {
              HStack {
                Text("Author").font(.headline)
                Spacer()
              }
              HStack {
                Text( self.article.author)
                  .foregroundColor(Color.blue)
                  .padding(.top, 10)
                Spacer()
              }
            }
          }.padding(.horizontal, 25)
          .padding(.top, 20)
          HStack {
            VStack {
              HStack {
                Text("Website").font(.headline)
                Spacer()
              }
              HStack {
                Text(self.article.sourceName)
                  .foregroundColor(Color.blue)
                  .padding(.top, 10)
                Spacer()
              }
            }
          }.padding(.horizontal, 25)
          .padding(.top, 20)
        }
      }
      Spacer()
    }
    .edgesIgnoringSafeArea(.all)
    .statusBar(hidden: true)
    .animation(.default)
    .navigationBarHidden(true)
  }
}
