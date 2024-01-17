//
//  RemoteAddAccountTests.swift
//  RemoteAddAccountTests
//
//  Created by Alex Oliveira on 17/01/24.
//

import XCTest
import Domain

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init (url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(addAccountModel: AddAccountModel) {
        let data = try? JSONEncoder().encode(addAccountModel)
        httpClient.post(url: url, data: data)
    }
}

protocol HttpPostClient {
    func post(url: URL, data: Data?)
}



final class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string:"http://any-url.com")!
        let httpClient = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClient)
        sut.add(addAccountModel: makeAddAccountModel())
        XCTAssertEqual(httpClient.url, url)
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let httpClient = HttpClientSpy()
        let sut = RemoteAddAccount(url: URL(string:"http://any-url.com")!, httpClient: httpClient)
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel)
        let data = try? JSONEncoder().encode(addAccountModel)
        XCTAssertEqual(httpClient.data, data)
    }
}

extension RemoteAddAccountTests {
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_mail@mail.com", password: "any_password", passwordConfirmation: "any_password")

    }
    
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        var data: Data?
        
        func post(url: URL, data: Data?) {
            self.url = url
            self.data = data
        }
    }
}
