//
//  SearchDependencies.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import Foundation

struct SearchDependencies: NetworkBase {
  let networkingService: Networking
  
  init(networkingService: Networking) {
    self.networkingService = networkingService
  }
}
