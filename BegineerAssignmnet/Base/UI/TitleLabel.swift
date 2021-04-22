//
//  TitleLabel.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import UIKit

class TitleLabel: UILabel {
  convenience init(
    font: UIFont,
    color: UIColor
  ) {
    self.font = font
    self.textColor = color
    super.init()
  }
}
