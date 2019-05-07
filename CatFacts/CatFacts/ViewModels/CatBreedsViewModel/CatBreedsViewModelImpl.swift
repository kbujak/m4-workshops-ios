//
//  File.swift
//  CatFacts
//
//  Created by Krystian Bujak on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CatBreedsViewModelImpl: CatBreedsViewModel {
    var context: AppContext
    var breeds = BehaviorRelay<[CatBreedDetailsViewModel]>(value: [])
    let bag = DisposeBag()

    required init(context: AppContext) {
        self.context = context
        context.network
            .fetchBreeds()
            .map { $0.map(CatBreedDetailsViewModelImpl.init) }
            .bind(to: breeds)
            .disposed(by: bag)
    }
}
