//
//  CatBreedDetailsViewModelImpl.swift
//  CatFacts
//
//  Created by Krystian Bujak on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import Foundation
import RxCocoa

class CatBreedDetailsViewModelImpl: CatBreedDetailsViewModel {
    var catBreed: CatBreed

    required init(catBreed: CatBreed) {
        self.catBreed = catBreed
    }
}
