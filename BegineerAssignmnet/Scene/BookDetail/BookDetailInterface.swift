//
//  BookDetailInterface.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation

protocol BookDetailPresenterInterface: AnyObject {
  var interactor: BookDetailInteractorInterface { get }
  var router: BookDetailRouterInterface { get }
  
  func transform(to inputs: BookDetailPresenter.Input) -> BookDetailPresenter.Output
}

protocol BookDetailInteractorInterface: AnyObject {
  func fetchMemobyISBN(isbn: String) -> BookWithMemoObject?
  func saveMemoWithISBN(isbn: String, memo: String) -> Void
}

protocol BookDetailRouterInterface: AnyObject {
  func popViewController()
}
