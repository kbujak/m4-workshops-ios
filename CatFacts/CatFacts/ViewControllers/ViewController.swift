//
//  ViewController.swift
//  CatFacts
//
//  Created by Krystian Bujak on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    private let anyView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.addSubview(anyView)
        anyView.backgroundColor = UIColor.blue
        anyView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10,
                                                                left: 10,
                                                                bottom: 10,
                                                                right: 10))
    }
}
