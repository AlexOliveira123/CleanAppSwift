//
//  RemoteAddAccountTests.swift
//  RemoteAddAccountTests
//
//  Created by Alex Oliveira on 17/01/24.
//

import XCTest
import Domain
import Data

final class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string:"http://any-url.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel: makeAddAccountModel())
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel)
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
}

extension RemoteAddAccountTests {
    func makeSut(url: URL = URL(string:"http://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClient = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClient)
        return (sut, httpClient)
    }
    
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_mail@mail.com", password: "any_password", passwordConfirmation: "any_password")

    }
    
    class HttpClientSpy: HttpPostClient {
        var urls = [URL]()
        var data: Data?
        
        func post(url: URL, data: Data?) {
            self.urls.append(url)
            self.data = data
        }
    }
}
