//
//  EmailValidator.swift
//  Presentation
//
//  Created by Alex Oliveira on 02/04/24.
//

import Foundation

public protocol EmailValidator {
    func isValid(email: String) -> Bool
}
