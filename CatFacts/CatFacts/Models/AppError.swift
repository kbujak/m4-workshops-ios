//
//  AppError.swift
//  CatFacts
//
//  Created by Marek Matulski on 06/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import SwiftyJSON

enum AppError: Error {
    case jsonParsing(String)
}

extension AppError {
    static func createJsonParsingError(_ json: JSON, file: String = #file, line: Int = #line) -> AppError {
        return .jsonParsing("\(file):\(line)\n\(json)")
    }
}
