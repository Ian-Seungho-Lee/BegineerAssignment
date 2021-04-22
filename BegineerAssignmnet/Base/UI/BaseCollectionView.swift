//
//  BaseCollectionView.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit
import SnapKit

// to be extended
class BaseCollectionView: UIView {
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  let refreshControl = UIRefreshControl()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setupBase()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupBase()
  }
  
  private func setupBase() {
    backgroundColor = Theme.Colors.Background.primary
    
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    addSubview(collectionView)
  
    collectionView.refreshControl = refreshControl
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
