//
//  BookDetailViewController.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/23.
//  
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class BookDetailViewController: UIViewController {
  private var bookDetailView: BookDetailView!
  private let disposeBag = DisposeBag()
  private let presenter: BookDetailPresenterInterface
  private let book: Book
  private let rightButton: UIButton = {
    $0.setTitle("저장", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.setTitleColor(Theme.Colors.Texts.primary, for: .normal)
    return $0
  }(UIButton(frame: .zero))
  
  init(
    book: Book,
    presenter: BookDetailPresenterInterface
  ) {
    self.book = book
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension BookDetailViewController {
  override func loadView() {
    bookDetailView = BookDetailView(book: book, frame: .zero)
    view = bookDetailView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigationItem()
    
  }
}

extension BookDetailViewController {
  private func setupNavigationItem() {
    navigationItem.title = book.title
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
  }
}
