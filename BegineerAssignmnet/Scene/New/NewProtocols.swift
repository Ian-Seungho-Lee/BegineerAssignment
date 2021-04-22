//
//  NewProtocols.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit
import RxSwift

protocol NewInteractorInterface: class {
  func fetchNewBookAPI() -> Observable<[Book]>
}

protocol NewPresenterInterface: class {
  var router: NewRouterInterface { get }
  var interactor: NewInteractorInterface { get }
  
  func transform(to inputs: NewPresenter.Input) -> NewPresenter.Output
}

protocol NewRouterInterface: class {
  
}

protocol NewViewInterface: class {
  
}
