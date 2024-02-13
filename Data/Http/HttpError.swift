//
//  HttpError.swift
//  Data
//
//  Created by Alex Oliveira on 22/01/24.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
