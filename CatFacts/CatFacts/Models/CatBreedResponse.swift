//
//  CatBreedResponse.swift
//  CatFacts
//
//  Created by Marek Matulski on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import SwiftyJSON

struct CatBreedResponse {
    let data: [CatBreed]

    init(json: JSON) throws {
        guard let dataArray = json["data"].array else {
            throw AppError.createJsonParsingError(json)
        }

        self.data = try dataArray.map({ breedJSON -> CatBreed in
            return try CatBreed(json: breedJSON)
        })
    }
}
