//
//  NewView.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxAlamofire

final class NewView: UIViewController {
  private var bookListView: BaseCollectionView!
  private let disposeBag = DisposeBag()
  private let presenter: NewPresenterInterface
  
  init(presenter: NewPresenterInterface) {
    self.presenter = presenter
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NewView {
  override func loadView() {
    bookListView = BaseCollectionView(layoutConfig: .init(widthHeightRatio: 11/10))
    view = bookListView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }
}

extension NewView {
  private func bind() {
    let inputs = NewPresenter.Input(
      viewWillAppear: rx.methodInvoked(#selector(UIViewController.viewWillAppear(_:))).map { _ in }
    )
    
    let outputs = presenter.transform(to: inputs)
    
    outputs.bookList
      .drive(bookListView.collectionView.rx.items(
              cellIdentifier: NewViewCollectionViewCell.identifier,
              cellType: NewViewCollectionViewCell.self)
      ) { index, item, cell in
        cell.bind(to: item)
      }
      .disposed(by: disposeBag)
  }
}
