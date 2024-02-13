//
//  TestFactories.swift
//  DataTests
//
//  Created by Alex Oliveira on 06/02/24.
//

import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Alex\"}".utf8)
}

func makeUrl() -> URL {
    return URL(string:"http://any-url.com")!
}
