//
//  NewProtocols.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit

protocol NewInteractorInterface: class {
  
}

protocol NewPresenterInterface: class {
  var router: NewRouterInterface { get }
  var interactor: NewInteractorInterface { get }
}

protocol NewRouterInterface: class {
  
}

protocol NewViewInterface: class {
  
}
