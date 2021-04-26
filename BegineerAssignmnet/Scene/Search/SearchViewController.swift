//
//  SearchView.swift
//  BegineerAssignmnet
//
//  Created by elesahich on 2021/04/22.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class SearchViewController: UIViewController, SearchViewInterface {
  private var bookListView: BaseCollectionView!
  let presenter: SearchPresenterInterface
  
  init(
    presenter: SearchPresenterInterface
  ) {
    self.presenter = presenter
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SearchViewController {
  override func loadView() {
    bookListView = BaseCollectionView(layoutConfig: .init(widthHeightRatio: 11/10))
    view = bookListView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMainView()
    setupCollectionView()
  }
}

extension SearchViewController {
  private func setupCollectionView() {
    let collectionView = bookListView.collectionView
    
    collectionView.register(
      NewViewCollectionViewCell.self,
      forCellWithReuseIdentifier: NewViewCollectionViewCell.identifier
    )

    collectionView.backgroundColor = Theme.Colors.Background.primary
  }
  
  private func setupMainView() {
    navigationItem.title = "Search Books"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
