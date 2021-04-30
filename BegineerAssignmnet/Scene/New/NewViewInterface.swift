//
//  NewProtocols.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit
import RxSwift

protocol NewViewInterface: AnyObject {
  var presenter: NewPresenterInterface { get }
}

protocol NewInteractorInterface: AnyObject {
  var networking: Networking { get }

  func fetchNewBookfromAPI() -> Observable<[Book]>
}

protocol NewPresenterInterface: AnyObject {
  var router: NewRouterInterface { get }
  var interactor: NewInteractorInterface { get }
  
  func transform(to inputs: NewPresenter.Input) -> NewPresenter.Output
}

protocol NewRouterInterface: AnyObject {
  func showBookDetail(to model: Book)
}

