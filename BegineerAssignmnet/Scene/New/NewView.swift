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
  }
}

extension NewView {
  private func bind() {
    
    
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
}
