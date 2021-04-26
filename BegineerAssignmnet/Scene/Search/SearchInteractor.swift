//
//  SearchInteractor.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/26.
//

import Foundation

final class SearchInteractor: SearchInteractorInterface {
  let networking: Networking

  init(networking: Networking) {
    self.networking = networking
  }
}
