//
//  CatBreedDetailsViewController.swift
//  CatFacts
//
//  Created by Krystian Bujak on 08/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import UIKit

class CatBreedDetailsViewController: UIViewController {

    private var viewModel: CatBreedDetailsViewModel

    init(viewModel: CatBreedDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyles()
    }

    private func setupStyles() {
        view.backgroundColor = UIColor.orange
    }
}
