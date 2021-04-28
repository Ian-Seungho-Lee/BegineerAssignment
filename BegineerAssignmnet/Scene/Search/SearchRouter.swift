//
//  SearchRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit

final class SearchRouter: NavigationRouterType, SearchRouterInterface {
  let navigationController: UINavigationController
  private let dependencies: SearchDependencies
  
  init(
    navigationController: UINavigationController,
    dependencies: SearchDependencies
  ) {
    self.navigationController = navigationController
    self.dependencies = dependencies
  }
  
  func start() {
    showSearchView()
  }
}

extension SearchRouter {
  private func showSearchView() {
    let interactor = SearchInteractor(
      networking: dependencies.networkingService,
      cacheWrapper: dependencies.cacheWrapper
    )
    let presenter = SearchPresenter(
      interactor: interactor,
      router: self
    )

    let searchViewController = SearchViewController(
      presenter: presenter
    )
    navigationController.show(searchViewController, sender: nil)
  }
}
