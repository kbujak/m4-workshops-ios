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
                let json1 = sampleData.breed01JSON
                let json2 = sampleData.breed02JSON
                do {
                    let breed1 = try CatBreed(json: json1)
                    let breed2 = try CatBreed(json: json2)
                    subscriber.onNext([breed1, breed2])
                } catch {
                    subscriber.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
