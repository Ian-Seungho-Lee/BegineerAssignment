//
//  NewViewCollectionViewCell.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//

import UIKit
import Kingfisher

final class NewViewCollectionViewCell: UICollectionViewCell {
  private let titleLabel = TitleLabel(font: .systemFont(ofSize: 16, weight: .medium))
  private let subtitleLabel = ContentsLabel(font: .systemFont(ofSize: 12, weight: .light))
  private let priceLabel = ContentsLabel(font: .systemFont(ofSize: 12, weight: .light))
  private let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCollectionViewCell()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupCollectionViewCell()
  }
  
  enum NewViewConstant {
    static let linespacing = 10
    static let itemspacing = 10
    static let horizontal = 10
    static let vertical = 10
  }
}

extension NewViewCollectionViewCell {
  private func setupCollectionViewCell() {
    layer.masksToBounds = true
    backgroundColor = Theme.Colors.Background.container
    layer.cornerRadius = 5 // 네놈은 이제 뷰가 생성된 이후..awakeFromNib으로 하세용
    
    setupMainView()
  }
  
  private func setupMainView() {
    [titleLabel, subtitleLabel, priceLabel, imageView].forEach { addSubview($0) }
    
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(150)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).inset(NewViewConstant.vertical)
      $0.leading.trailing.equalToSuperview().inset(NewViewConstant.horizontal)
    }
    
    subtitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).inset(NewViewConstant.vertical/2)
      $0.leading.trailing.equalToSuperview().inset(NewViewConstant.horizontal)
    }
    
    priceLabel.snp.makeConstraints {
      $0.top.equalTo(subtitleLabel.snp.bottom).inset(NewViewConstant.vertical/2)
      $0.leading.trailing.equalToSuperview().inset(NewViewConstant.horizontal)
      $0.bottom.equalToSuperview().inset(NewViewConstant.vertical/2)
    }
  }
}

extension NewViewCollectionViewCell {
  func bind(to model: Book) {
    self.imageView.kf.setImage(with: URL(string: model.image))
    self.titleLabel.text = model.title
    self.subtitleLabel.text = model.subtitle
    self.priceLabel.text = model.price
  }
}

