//
//  NewRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit

final class NewRouter: NavigationRouterType {
    let navigationController: UINavigationController
    let dependencies: NewDependencies
    
    init(
        navigationController: UINavigationController,
        dependencies: NewDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showNewBookList()
    }
}

extension NewRouter {
    private func showNewBookList() {
        let viewController = NewView()
        navigationController.show(viewController, sender: nil)
    }
}
