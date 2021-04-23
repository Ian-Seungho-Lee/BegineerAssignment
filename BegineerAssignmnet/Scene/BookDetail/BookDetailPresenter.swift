//
//  BookDetailPresenter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation

class BookDetailPresenter: BookDetailPresenterInterface {
  var interactor: BookDetailInteractorInterface
  var router: BookDetailRouterInterface
  
  init(
    interactor: BookDetailInteractorInterface,
    router: BookDetailRouterInterface
  ) {
    self.interactor = interactor
    self.router = router
  }
}

