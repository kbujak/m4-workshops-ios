//
//  AppCoordinator.swift
//  CatFacts
//
//  Created by Krystian Bujak on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import Foundation
import UIKit

protocol AppCoordinatorDelegate: AnyObject {
    func didSelectCell(with catBreedDetailsViewModel: CatBreedDetailsViewModel)
}

class AppCoordinator: RootCoordinator {
    var rootController: UINavigationController?

    private weak var window: UIWindow?
    private var context: AppContext
    private var childs: [ChildCoordinator] = []

    init(context: AppContext, window: UIWindow?) {
        self.context = context
        self.window = window
    }

    func start() {
        let viewModel = CatBreedsViewModelImpl(context: context)
        viewModel.delegate = self

        let viewController = CatBreedsViewController(viewModel: viewModel)
        rootController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }

    func pop(_ coordinatod: ChildCoordinator) {
        guard
            let viewController = coordinatod.controller,
            let index = childs.firstIndex(where: { $0 === coordinatod })
            else { return }
        
        childs.remove(at: index)
        viewController.removeFromParent()
    }

    private func push(_ coordinator: ChildCoordinator) {
        guard let viewController = coordinator.controller else { return }
        
        childs.append(coordinator)
        rootController?.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: AppCoordinatorDelegate {
    func didSelectCell(with catBreedDetailsViewModel: CatBreedDetailsViewModel) {
        let catBreedDetailsCoordinator = CatBreedDetailsCoordinator(context: context,
                                                                    viewModel: catBreedDetailsViewModel)
        catBreedDetailsCoordinator.rootCoordinator = self
        catBreedDetailsCoordinator.start()

        push(catBreedDetailsCoordinator)
    }
}
