//
//  BaseCollectionView.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BaseCollectionView: UIView {
  private(set) var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  private let layoutConfig: LayoutConfig

  init(layoutConfig: LayoutConfig, frame: CGRect = .zero) {
    self.layoutConfig = layoutConfig
    super.init(frame: frame)
    
    setupMainView()
  }
  
  required init?(coder: NSCoder) {
    self.layoutConfig = LayoutConfig(widthHeightRatio: 29/36)
    
    super.init(coder: coder)
    setupMainView()
  }
  
  private func setupMainView() {
    backgroundColor = Theme.Colors.Background.primary
    
    addSubview(collectionView)
    
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    setupCollectionView()
  }
}

extension BaseCollectionView: UICollectionViewDelegateFlowLayout {
  func setupCollectionView() {
    
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = UIScreen.main.bounds.width - 40
    return CGSize(width: width / 2, height: width / 2)
  }
  
}


extension BaseCollectionView {
  struct LayoutConfig {
    let interItemSpacing: CGFloat = 25
    let insets: UIEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    let numberOfItems: UInt = 2
    let widthHeightRatio: CGFloat
  }
}



extension UIViewController {
  func addSearchBar(placeholder: String? = nil) {
    let searchController = UISearchController()
    searchController.searchBar.tintColor = Theme.Colors.Components.primary
    searchController.obscuresBackgroundDuringPresentation = false
    navigationItem.searchController = searchController
    
    if let placeholder = placeholder {
      searchController.searchBar.placeholder = placeholder
    }
  }
}
