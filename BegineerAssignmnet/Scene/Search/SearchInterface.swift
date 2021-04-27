//
//  SearchInterface.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/26.
//

import Foundation
import RxSwift

protocol SearchViewInterface: class {
  var presenter: SearchPresenterInterface { get }
}

protocol SearchInteractorInterface: class {
  // netwokring, cache Dependency
  var networking: Networking { get }

  func fetchPaginatedSearchResult(searchText: Observable<String>, loadNextPage: Observable<Void>) -> Observable<[Book]>
}

protocol SearchPresenterInterface: class {
  var interactor: SearchInteractorInterface { get }
  var router: SearchRouterInterface { get }
  
  func transform(inputs: SearchPresenter.Input) -> SearchPresenter.Output
}

protocol SearchRouterInterface: class {
  
}
