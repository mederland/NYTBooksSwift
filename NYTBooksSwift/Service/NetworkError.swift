//
//  NetworkError.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidStatusCode(Int)
    case generalError(Error)
}
