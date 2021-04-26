//
//  BookDetailDependencies.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//

import Foundation

class BookDetailDependencies: NetworkBase {
  let networkingService: Networking
  
  init(dependencies: AppDependencies) {
    self.networkingService = dependencies.networkingService
  }  
}
