//
//  AppCoordinator.swift
//  CatFacts
//
//  Created by Krystian Bujak on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: RootCoordinator {
    var rootController: UINavigationController?

    private weak var window: UIWindow?
    private var context: AppContext

    init(context: AppContext, window: UIWindow?) {
        self.context = context
        self.window = window
    }

    func start() {
        let viewModel = CatBreedsViewModelImpl(context: context)

        let viewController = CatBreedsViewController(viewModel: viewModel)
        rootController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}
