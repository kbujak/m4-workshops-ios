//
//  CatBreedDetailsViewModel.swift
//  CatFacts
//
//  Created by Krystian Bujak on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import Foundation
import RxCocoa

protocol CatBreedDetailsViewModel {
    var catBreed: CatBreed { get }

    init(catBreed: CatBreed)
}
