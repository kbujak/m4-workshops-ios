//
//  NetworkProvider.swift
//  CatFacts
//
//  Created by Marek Matulski on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import RxSwift

protocol NetworkProvider {
    func fetchBreeds() -> Observable<[CatBreed]>
}
