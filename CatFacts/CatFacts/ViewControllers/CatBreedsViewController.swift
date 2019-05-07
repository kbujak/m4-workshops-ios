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

        view.addSubview(tableView)

        setupLayouts()
        setupStyles()
        setupBinding()

        tableView.register(CatBreedTableViewCell.self, forCellReuseIdentifier: catBreedCellId)
    }

    private func setupBinding() {
        viewModel.breeds
            .bind(to: tableView.rx.items(cellIdentifier: catBreedCellId,
                                         cellType: CatBreedTableViewCell.self)) { _, viewModel, cell in
                cell.setup(with: viewModel)
            }
            .disposed(by: bag)
    }
}

extension CatBreedsViewController {
    private func setupLayouts() {
        tableView.autoPinEdgesToSuperviewSafeArea()
    }

    private func setupStyles() {
        tableView.separatorStyle = .none
        navigationItem.title = "Cat Breeds"
    }
}
