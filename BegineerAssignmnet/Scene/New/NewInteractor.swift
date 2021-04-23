//
//  NewInteractor.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation
import RxSwift

final class NewInteractor: NewInteractorInterface {
  let networking: Networking
  
  init(dependencies: NewDependencies) {
    self.networking = dependencies.networkingService
  }
}

extension NewInteractor {
  func fetchNewBookListEndpoint() -> Endpoint<NewBookResponseType<Book>> {
    let url = URLBuilder()
      .set(path: "new")
      .build()!
    
    return Endpoint(method: .get, url: url)
  }
  
  func fetchNewBookAPI() -> Observable<[Book]> {
    return networking
      .requestObservable(fetchNewBookListEndpoint())
      .map { $0.books }
  }
}
