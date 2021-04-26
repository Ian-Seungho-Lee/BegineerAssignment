//
//  NewRouter.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/21.
//

import UIKit

final class NewRouter: NavigationRouterType, NewRouterInterface {
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
    let interactor = NewInteractor(dependencies: dependencies)
    let presenter = NewPresenter(
      router: self,
      interactor: interactor
    )
    
    let viewController = NewView(presenter: presenter)
    navigationController.show(viewController, sender: nil)
  }
  
  func showBookDetail(to about: Book) {
    let presenter = BookDetailPresenter(
      interactor: BookDetailInteractor(),
      router: BookDetailRouter()
    )
    // router에는 이제 dependencies랑 네비게이션을 넣어줘야겟죠?
    // 
    
    let bookDetailViewController = BookDetailView(
      presenter: presenter
    )
    
    navigationController.pushViewController(bookDetailViewController, animated: true)
  }
}
