//
//  BaseCollectionView.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit
import SnapKit

class BaseCollectionView: UIView {
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  let refreshControl = UIRefreshControl()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    backgroundColor = Theme.Colors.Background.primary
    
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.scrollDirection = .vertical
      layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    addSubview(collectionView)
    
    collectionView.refreshControl = refreshControl
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
