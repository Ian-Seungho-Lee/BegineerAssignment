//
//  BookDetailViewController.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class BookDetailView: UIViewController {
  private let disposeBag = DisposeBag()
  private let presenter: BookDetailPresenterInterface
  
  init(presenter: BookDetailPresenterInterface) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension BookDetailView {
  override func loadView() {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
}
