//
//  BookDetailInterface.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation

protocol BookDetailPresenterInterface: class {
  var interactor: BookDetailInteractorInterface { get }
  var router: BookDetailRouterInterface { get }
}


protocol BookDetailInteractorInterface: class {
  
}

protocol BookDetailRouterInterface: class {
  
}
