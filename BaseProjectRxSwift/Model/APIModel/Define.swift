//
//  Define.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation

enum Define {
    enum UrlString: String {
        #if DEBUG
        case apiBaseUrl = "https://ep.dev.hblab.co.jp/api/v1"
        #else
        case apiBaseUrl = "https://ep.dev.hblab.co.jp/api/v1"
        #endif
        case settingUrl = "app-settings:"
    }
    
    struct Api {
        static let baseUrl = UrlString.apiBaseUrl.rawValue
        static let os = 2
    }
}
