//
//  CatBreedsViewController.swift
//  CatFacts
//
//  Created by Krystian Bujak on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift
import RxCocoa

class CatBreedsViewController: UIViewController {
    private let tableView = UITableView()
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    private let errorLabel = UILabel()
    private let viewModel: CatBreedsViewModel
    private let bag = DisposeBag()
    private let catBreedCellId = "CatBreedCellId"

    init(viewModel: CatBreedsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CatBreedTableViewCell.self, forCellReuseIdentifier: catBreedCellId)

        [tableView, activityIndicator, errorLabel].forEach { view.addSubview($0) }

        setupLayouts()
        setupStyles()
        setupBinding()

        viewModel.setup()
    }

    private func setupBinding() {
        viewModel.breedsCellsModels
            .bind(to: tableView.rx.items(cellIdentifier: catBreedCellId,
                                         cellType: CatBreedTableViewCell.self)) { _, viewModel, cell in
                cell.setup(with: viewModel)
            }
            .disposed(by: bag)

        viewModel.isInProgress
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: bag)

        viewModel.errorMessage
            .bind(to: errorLabel.rx.text)
            .disposed(by: bag)

        viewModel.errorMessage
            .map { $0?.isEmpty ?? false }
            .bind(to: errorLabel.rx.isHidden)
            .disposed(by: bag)
    }
}

extension CatBreedsViewController {
    private func setupLayouts() {
        tableView.autoPinEdgesToSuperviewSafeArea()

        activityIndicator.autoCenterInSuperview()
        errorLabel.autoCenterInSuperview()
        errorLabel.autoPinEdge(toSuperviewEdge: ALEdge.left)
        errorLabel.autoPinEdge(toSuperviewEdge: ALEdge.right)
    }

    private func setupStyles() {
        tableView.separatorStyle = .none
        navigationItem.title = "Cat Breeds"
        activityIndicator.hidesWhenStopped = true
        errorLabel.font = UIFont(name: "Helvetica", size: 20.0)
        errorLabel.textColor = UIColor.red
        errorLabel.isHidden = true
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
}
