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

// Moya의 그 Response...그립네요..
extension NewInteractor {
  static func fetchNewBookListEndpoint() -> Endpoint<NewBookResponseType<Book>> {
    let url = URLBuilder()
      .set(path: "new")
      .build()!
    
    return Endpoint(method: .get, url: url)
  }
  
  func fetchNewBookAPI() -> Observable<[Book]> {
    networking.requestObservable(NewInteractor.fetchNewBookListEndpoint())
      .flatMapLatest { apiResponse -> Observable<[Book]> in
        return .just(apiResponse.books)
      }
  }
}
