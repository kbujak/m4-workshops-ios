//
//  CatBreed.swift
//  CatFacts
//
//  Created by Marek Matulski on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import SwiftyJSON

struct CatBreed {
    let breed: String
    let country: String
    let origin: String
    let coat: String
    let pattern: String

    init(json: JSON) throws {
        guard let breed = json["breed"].string else {
            throw AppError.createJsonParsingError(json)
        }

        self.breed = breed
        country = json["country"].string ?? ""
        origin = json["origin"].string  ?? ""
        coat = json["coat"].string  ?? ""
        pattern = json["pattern"].string ?? ""
    }
}
