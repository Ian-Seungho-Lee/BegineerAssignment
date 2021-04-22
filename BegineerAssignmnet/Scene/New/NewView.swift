//
//  ViewController.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/21.
//

import UIKit
import RxSwift
import SnapKit

final class NewView: UIViewController {
  private var bookListCollectionView: BaseCollectionView!
  
  
}

// 여기랑 엮이는게 누구누군지랑.. 그런것들을 좀 알아보자 Action handling이 어떻게 일어나는가요?
extension NewView {
  override func loadView() {
    bookListCollectionView = BaseCollectionView()
    view = bookListCollectionView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
