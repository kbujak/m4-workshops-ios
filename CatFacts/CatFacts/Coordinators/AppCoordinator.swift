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

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let viewController = CatBreedsViewController()
        rootController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}
