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
    bookListView = BaseCollectionView()
    view = bookListView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
    bind()
  }
}

extension NewView {
  private func bind() {
    let viewDidLoad = PublishSubject<Void>()
    let collectionView = bookListView.collectionView
    
    let inputs = NewPresenter.Input(
      viewDidLoad: viewDidLoad
    )
    
    let outputs = presenter.transform(to: inputs)
    
    outputs.bookList
//      .do { print($0, #line) } // cell이 이상한 일이 뭐가 있는가 과연..??
      .drive(onNext: {
        print($0)
      })
      .disposed(by: disposeBag)
    viewDidLoad.onNext(())
  }
}

extension NewView: UICollectionViewDelegateFlowLayout {
  private func setupCollectionView() {
    let collectionView = bookListView.collectionView
    
    collectionView
      .rx.setDelegate(self)
      .disposed(by: disposeBag)
    
    collectionView.register(
      NewViewCollectionViewCell.self,
      forCellWithReuseIdentifier: NewViewCollectionViewCell.identifier
    )
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = UIScreen.main.bounds.width

    return CGSize(width: width/2, height: width/2)
  }
}
