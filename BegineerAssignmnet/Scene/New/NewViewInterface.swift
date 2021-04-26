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


// 이전 라우터는 라우팅 책임, 이전받는 라우터는 뷰를 띄우는 책임. 그럼 코디네이터랑 똑닮음요

