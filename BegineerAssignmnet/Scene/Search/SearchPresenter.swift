//
//  SearchPresenter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/26.
//

import Foundation
import RxSwift

final class SearchPresenter: SearchPresenterInterface {
  let interactor: SearchInteractorInterface
  let router: SearchRouterInterface
  
  init(
    interactor: SearchInteractorInterface,
    router: SearchRouterInterface
  ) {
    self.interactor = interactor
    self.router = router
  }
}

