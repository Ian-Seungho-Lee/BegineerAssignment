//
//  NewPresenter.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit
import RxSwift
import struct RxCocoa.Driver

final class NewPresenter: NewPresenterInterface {
  let router: NewRouterInterface
  let interactor: NewInteractorInterface
  
  init(
    router: NewRouterInterface,
    interactor: NewInteractorInterface
  ) {
    self.router = router
    self.interactor = interactor
  }
  
  struct Input {
    let viewDidLoad: Observable<Void>
  }
  
  struct Output {
//    let bookList: Driver<[Book]>
  }
}

extension NewPresenter {
  func transform(to input: Input) -> Output {
    
    
    
    
    return .init()
  }
}
// 타르겔라씨는 Input Output 이런거 아예 신경 안쓰시긴 하던데
// 그냥 클래스를 따로 뺴는것이 핵심이고 게다가 viewModel 내에서는 구독 안하는것이 핵심이라면
// 그렇게 가줘도 되는거라고 보거든요
// 프라이빗 선언 안하고,,init에서 해결하고... 뭐 이런거 아니겠어요.
