//
//  SearchPresenter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/26.
//

import Foundation
import RxSwift
import struct RxCocoa.Driver

final class SearchPresenter: SearchPresenterInterface {
  let interactor: SearchInteractorInterface
  let router: SearchRouterInterface
  
  init(
    interactor: SearchInteractorInterface,
    router: SearchRouterInterface
  ) {
    self.interactor = interactor
    self.router = router
  }
  
  struct Input {
    let searchText: Observable<String>
    let reachtoBottom: Observable<Void>
  }
  
  struct Output {
    let book: Driver<[Book]>
  }
}

extension SearchPresenter {
  func transform(to inputs: Input) -> Output {
    let searchedItem = interactor.fetchPaginatedSearchResult(
      searchText: inputs.searchText.debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance),
      loadNextPage: inputs.reachtoBottom
    )
    .share()
      
    return .init(book: searchedItem.asDriver(onErrorDriveWith: .empty()))
  }
}
