//
//  SearchRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit

final class SearchRouter: NavigationRouterType {
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
        let searchViewController = SearchView()
        navigationController.show(searchViewController, sender: nil)
    }
}
