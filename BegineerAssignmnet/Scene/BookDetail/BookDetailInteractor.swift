//
//  BookDetailInteractor.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

final class BookDetailInteractor: BookDetailInteractorInterface {
  let networking: Networking
  let realm: Realm
  
  init(dependencies: BookDetailDependencies) {
    self.networking = dependencies.networkingService
    self.realm = dependencies.realm
  }
}

extension BookDetailInteractor {
  func fetchMemobyISBN(isbn: String) -> BookWithMemoObject? {
    return realm.object(ofType: BookWithMemoObject.self, forPrimaryKey: isbn)
  }
  
  func saveMemoWithISBN(isbn: String, memo: String) -> Void {
    let object = BookWithMemoObject(isbn: isbn, memo: memo)
    
    try! realm.write {
      realm.add(object, update: .modified)
    }
  }
}
