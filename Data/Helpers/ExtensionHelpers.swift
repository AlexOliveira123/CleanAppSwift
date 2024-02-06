//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Alex Oliveira on 06/02/24.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
