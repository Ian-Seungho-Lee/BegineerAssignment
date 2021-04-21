//
//  AppRouter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/21.
//

import UIKit

enum AppBaseRouterType {
  case onboard
  case tabbar
}

class AppRouter: BaseRouterType {
  private let appdependencies: AppDependencies
  let navigationController: UINavigationController
  
  init(
    appdependecies: AppDependencies,
    navigationController: UINavigationController
  ) {
    self.appdependencies = appdependecies
    self.navigationController = navigationController
  }

  func start() {
    showTabbar()
  }
}

extension AppRouter {
  private func showTabbar() {
    let tabDependencies = TabbarDependencies()
    let tabbarRouter = TabbarRouter(
      navigationController: navigationController,
      dependencies: tabDependencies
    )
    tabbarRouter.start()
  }
  
  private func store() { 
    
  }
  
  private func release() {
    
  }
}
