//
//  BookDetailDependencies.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//

import Foundation

struct BookDetailDependencies: NetworkBase {
  let networkingService: Networking
  
  init(networkingService: Networking) {
    self.networkingService = networkingService
  }  
}
