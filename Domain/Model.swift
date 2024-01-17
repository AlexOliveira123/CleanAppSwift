//
//  Model.swift
//  Domain
//
//  Created by Alex Oliveira on 17/01/24.
//

import Foundation

public protocol Model: Encodable { }

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
