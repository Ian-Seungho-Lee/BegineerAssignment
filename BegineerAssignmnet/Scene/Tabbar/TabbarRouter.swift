//
//  TabbarRouter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/21.
//

import UIKit

enum TabbarChildType {
  case new
  case search
}

class TabbarRouter: NavigationRouterType {
  let navigationController: UINavigationController
  private var tabbarController: UITabBarController?
  private let dependencies: TabbarDependencies
  
  init(
    navigationController: UINavigationController,
    dependencies: TabbarDependencies
  ) {
    self.navigationController = navigationController
    self.dependencies = dependencies
  }
}

extension TabbarRouter {
  func start() {
    
    
  }
}

extension TabbarRouter {
  private func configureNavigationControllerWithTabs(title: String, image: UIImage?) -> UINavigationController {
      let navigationController: UINavigationController = {
          let naviVC = UINavigationController()
          naviVC.tabBarItem.title = title
          naviVC.tabBarItem.image = image
          return naviVC
      }()
      return navigationController
  }
}
