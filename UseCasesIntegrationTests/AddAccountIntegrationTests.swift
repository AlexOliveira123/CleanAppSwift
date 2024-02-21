//
//  UseCasesIntegrationTests.swift
//  UseCasesIntegrationTests
//
//  Created by Alex Oliveira on 21/02/24.
//

import XCTest
import Data
import Infra
import Domain

final class AddAccountIntegrationTests: XCTestCase {
    func test_add_account() {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://clean-node-api.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Alex Oliveira", email: "allex.c.o@hotmail.com", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
                case .failure: XCTFail("Expect success got \(result) instead")
                case .success(let account):
                    XCTAssertNotNil(account.id)
                    XCTAssertEqual(account.name, addAccountModel.name)
                    XCTAssertEqual(account.email, addAccountModel.email)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
