//
//  Define.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation

enum Define {
    struct Api {
        static let baseUrl = UrlString.apiBaseUrl.rawValue
        static let os = 2
    }
    
    struct ApiV2 {
        static let baseUrl = UrlStringV2.apiBaseUrl.rawValue
        static let os = 2
    }
    
    enum UrlString: String {
        #if DEBUG
        case apiBaseUrl = "https://example.com/v1/"
        #else
        case apiBaseUrl = "https://example.com/v1/"
        #endif
        case settingUrl = "app-settings:"
    }
    
    enum UrlStringV2: String {
        #if DEBUG
        case apiBaseUrl = "https://example.com/v2/"
        #else
        case apiBaseUrl = "https://example.com/v2/"
        #endif
        case settingUrl = "app-settings:"
    }
}
