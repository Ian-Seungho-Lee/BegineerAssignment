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
  func fetchNewBookList() {
    let url = URLBuilder()
      .set(path: "new")
      .build()!
    
    let endpoint = Endpoint(
      method: .get,
      url: url
    )
  }
}
