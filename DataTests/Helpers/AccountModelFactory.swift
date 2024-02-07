//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by Alex Oliveira on 06/02/24.
//

import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "any_id", name: "any_name", email: "any_mail@mail.com", password: "any_password")
}
