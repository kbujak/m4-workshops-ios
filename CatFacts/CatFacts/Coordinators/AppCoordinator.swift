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
    func didSelect(breed: CatBreed)
}

class AppCoordinator: RootCoordinator {
    var rootController: UINavigationController?

    private weak var window: UIWindow?
    private var context: AppContext
    private var children: [ChildCoordinator] = []

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

    func pop(_ coordinator: ChildCoordinator) {
        guard
            let viewController = coordinator.controller,
            let index = children.firstIndex(where: { $0 === coordinator })
            else { return }

        children.remove(at: index)
        viewController.removeFromParent()
    }

    private func push(_ coordinator: ChildCoordinator) {
        guard let viewController = coordinator.controller else { return }

        children.append(coordinator)

        DispatchQueue.main.async { [weak self] in
            self?.rootController?.pushViewController(viewController, animated: true)
        }

    }
}

extension AppCoordinator: AppCoordinatorDelegate {
    func didSelect(breed: CatBreed) {
        let catBreedDetailsCoordinator = CatBreedDetailsCoordinator(context: context,
                                                                    breed: breed)
        catBreedDetailsCoordinator.rootCoordinator = self
        catBreedDetailsCoordinator.start()

        push(catBreedDetailsCoordinator)
    }
}
