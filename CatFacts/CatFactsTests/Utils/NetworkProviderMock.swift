//
//  NetworkProviderMock.swift
//  CatFactsTests
//
//  Created by Marek Matulski on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import RxSwift
#if TEST
@testable import CatFacts
#endif

class NetworkProviderMock: NetworkProvider {
    func fetchBreeds() -> Observable<[CatBreed]> {
        return Observable<[CatBreed]>.create { [weak self] subscriber -> Disposable in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
                guard self != nil else { return }
                let sampleData = SampleData()
                let json = sampleData.breed01JSON
                do {
                    let breed = try CatBreed(json: json)
                    subscriber.onNext([breed])
                } catch {
                    subscriber.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
