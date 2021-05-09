//
//  File.swift
//  
//
//  Created by Wanhar on 08/05/21.
//

import Foundation
import Core

public typealias ArticlesInteractor = Interactor<String, [ArticleModel], ArticlesRepository <
                                                ArticlesLocaleDataSourceImpl,
                                                ArticlesRemoteDataSource,
                                                ArticlesTransformer>>
