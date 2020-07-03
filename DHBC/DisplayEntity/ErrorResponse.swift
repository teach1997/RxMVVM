//
//  ErrorResponse.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation

struct ErrorInfo: Decodable {
    let response: ErrorResponse
}

struct ErrorResponse: Decodable {
    let status: Int
    let info: String
}
