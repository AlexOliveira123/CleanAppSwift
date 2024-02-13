//
//  HttpPostClient.swift
//  Data
//
//  Created by Alex Oliveira on 17/01/24.
//

import Foundation


public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
