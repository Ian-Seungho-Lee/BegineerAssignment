//
//  NewViewCollectionViewCell.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit

enum NewViewConstant {
  static let linespacing = 10
  static let itemspacing = 10
}

final class NewViewCollectionViewCell: UICollectionViewCell {
  
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCollectionViewCell()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupCollectionViewCell()
  }
}

extension NewViewCollectionViewCell {
  private func setupCollectionViewCell() {
      layer.masksToBounds = true
      backgroundColor = Theme.Colors.Background.container
      layer.cornerRadius = 5
  }
}


