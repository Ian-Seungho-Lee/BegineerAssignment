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
    self.numberOfLines = 0
  }
  
  // 둘중에는 그러면 어디에 들어갈지 어떻게알앙 생성자는..??
  // 상당히 똑똑하네...
  
  convenience init(
    color: UIColor = Theme.Colors.Texts.primary,
    font: UIFont = .systemFont(ofSize: 20, weight: .medium),
    numberOflines: Int = 2
  ) {
    self.init()
    self.textColor = color
    self.font = font
    self.numberOfLines = numberOflines
  }
}
