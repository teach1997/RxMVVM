//
//  LoginModel.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation

struct Account: Codable {
    var email: String
    var password: String
    var param: [String: Any] {
        return [
            "email": email,
            "password": password
        ]
    }
}

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let status: Int
    let message: Message
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case status, message
        case accessToken = "access_token"
    }
}

// MARK: - Message
struct Message: Codable {
    let data: String
}

