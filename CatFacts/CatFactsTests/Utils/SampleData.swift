//
//  SampleData.swift
//  CatFactsTests
//
//  Created by Marek Matulski on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import SwiftyJSON

class SampleData: NSObject {
    var breed01JSON: JSON {
        return JSON([
            "breed": "Abyssinian",
            "country": "Ethiopia",
            "origin": "Natural/Standard",
            "coat": "Short",
            "pattern": "Ticked"
            ])
    }

    var breed02JSON: JSON {
        return JSON([
            "breed": "Aegean",
            "country": "Greece",
            "origin": "Natural/Standard",
            "coat": "Semi-long",
            "pattern": "Bi- or tri-colored"
            ])
    }

    var breedInvalidJSON: JSON {
        return JSON([
            "wrongbreedkey": "Abyssinian",
            "country": "Ethiopia",
            "origin": "Natural/Standard",
            "coat": "Short",
            "pattern": "Ticked"
            ])
    }
}
