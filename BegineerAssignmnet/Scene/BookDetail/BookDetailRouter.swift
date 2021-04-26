//
//  BookDetailRouter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation
import UIKit

class BookDetailRouter: NavigationRouterType, BookDetailRouterInterface {
  let navigationController: UINavigationController
  private let dependencies: BookDetailDependencies
  
  init(
    navigationController: UINavigationController,
    dependencies: BookDetailDependencies
  ) {
    self.navigationController = navigationController
    self.dependencies = dependencies
  }
  
  func start() { }
    
}
