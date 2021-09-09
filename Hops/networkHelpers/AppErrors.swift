//
//  AppErrors.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation
enum AppErrors: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badstatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
