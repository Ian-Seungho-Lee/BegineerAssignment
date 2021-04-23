//
//  ViewController.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/21.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

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
    bookListView = BaseCollectionView(layoutConfig: .init(widthHeightRatio: 29/36))
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
      .drive(onNext: { _ in
//        print($0, #line) // 이건 되고 아래건 안되는 이유는??
      })
      .disposed(by: disposeBag)
        
    Observable.of(["12,223", "123"])
      .asDriver(onErrorDriveWith: .empty())
      .drive(bookListView.collectionView.rx.items(
        cellIdentifier: NewViewCollectionViewCell.identifier,
        cellType: NewViewCollectionViewCell.self
      )) { index, item, cell in
        print(#function)
        print(item)
      }
      .disposed(by: disposeBag)
  }
}

extension NewView: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = view.frame.width - 40
    return CGSize(width: width / 2, height: width / 2)
  }
}
