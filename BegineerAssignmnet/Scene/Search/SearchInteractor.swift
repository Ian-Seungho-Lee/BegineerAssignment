//
//  SearchInteractor.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/26.
//

import Foundation
import RxSwift

final class SearchInteractor: SearchInteractorInterface {
  let networking: Networking
  
  init(networking: Networking) {
    self.networking = networking
  }
}

extension SearchInteractor {
  private func searchBookEndpoint(_ bookname: String,_ page: Int) -> Endpoint<SearchBookResponse<Book>> {
    let url = URLBuilder()
      .set(path: "search/\(bookname)/\(page)")
      .build()!
    
    print(url, #line, "여기여기")
    
    return Endpoint(method: .get, url: url)
  }
  
  func searchBookbyName(bookname: String, page: Int) -> Single<[Book]> {
    return networking.requestObservable(searchBookEndpoint(bookname, page))
      .map { $0.books }
      .asSingle()
  }
  
  func fetchPaginatedSearchResult(
    searchText: Observable<String>,
    loadNextPage: Observable<Void>
  ) -> Observable<[Book]> {
    let source = PaginationUISource(search: searchText, loadNextPage: loadNextPage)
    return searchText
      .flatMapLatest { [weak self] text -> Observable<[Book]> in
        guard let self = self else { return .empty() }
        
        let sink = PaginationSink(ui: source, loadData: self.searchBookbyName)
        return sink.elements
      }
  }
}
