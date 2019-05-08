//
//  CatBreedDetailsCoordinator.swift
//  CatFacts
//
//  Created by Krystian Bujak on 08/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import Foundation
import UIKit

class CatBreedDetailsCoordinator: ChildCoordinator {
    var controller: UIViewController?
    weak var rootCoordinator: RootCoordinator?

    private var context: AppContext
    private var viewModel: CatBreedDetailsViewModel

    init(context: AppContext, breed: CatBreed) {
        self.context = context
        self.viewModel = CatBreedDetailsViewModelImpl(catBreed: breed)
        print(viewModel.catBreed.breed)
    }

    func start() {
        controller = CatBreedDetailsViewController(viewModel: viewModel)
    }
}
