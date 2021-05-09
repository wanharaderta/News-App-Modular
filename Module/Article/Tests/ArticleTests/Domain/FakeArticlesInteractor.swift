//
//  File.swift
//  
//
//  Created by Wanhar on 09/05/21.
//

import Foundation
import Core
import Article

typealias FakeArticlesInteractor = Interactor<String, [ArticleModel], ArticlesRepository <
                                                FakeArticlesLocaleDataSourceImpl,
                                                FakeArticlesRemoteDataSource,
                                                ArticlesTransformer>>
