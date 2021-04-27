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
        
    return Endpoint(method: .get, url: url)
  }
  
  private func searchBookbyName(bookname: String, page: Int) -> Observable<[Book]> {
    return networking.requestObservable(searchBookEndpoint(bookname, page))
      .map { $0.books }
  }
    
  func fetchPaginatedSearchResult(
    searchText: Observable<String>,
    loadNextPage: Observable<Void>
  ) -> Observable<[Book]> {
    let source = PaginationUISource(search: searchText, loadNextPage: loadNextPage)
    let sink = PaginationSink(ui: source, loadData: searchBookbyName)
    
    return sink.elements
  }
}
