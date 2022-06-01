//
//  CardError.swift
//  EnglishFlashing
//
//  Created by bao le gia on 31/05/2022.
//

import Foundation

enum CardError: Error {
    case failed
    case timeout
    var getError: String {
        switch self {
        case .failed:
            return "Oops, something orrcured, falied to fetch data"
        case .timeout:
            return "Timed out"
        }
    }
}
