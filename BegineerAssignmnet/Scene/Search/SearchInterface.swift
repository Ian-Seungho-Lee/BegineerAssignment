//
//  SearchInterface.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/26.
//

import Foundation
import RxSwift

protocol SearchViewInterface: AnyObject {
  var presenter: SearchPresenterInterface { get }
}

protocol SearchInteractorInterface: AnyObject {
  var cacheWrapper: CacheWrapper<String, [Book]> { get }
  var networking: Networking { get }

  func fetchPaginatedSearchResult(searchText: Observable<String>, loadNextPage: Observable<Void>) -> Observable<[Book]>
}

protocol SearchPresenterInterface: AnyObject {
  var interactor: SearchInteractorInterface { get }
  var router: SearchRouterInterface { get }
  
  func transform(to inputs: SearchPresenter.Input) -> SearchPresenter.Output
}

protocol SearchRouterInterface: AnyObject {
  func showBookDetail(to model: Book) 
}
