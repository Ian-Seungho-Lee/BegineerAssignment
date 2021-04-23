//
//  TitleLabel.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit

class TitleLabel: UILabel {
  convenience init(
    color: UIColor = Theme.Colors.Texts.primary,
    font: UIFont = .systemFont(ofSize: 20, weight: .medium)
  ) {
    self.init()
    self.textColor = color
    self.font = font
  }
}
