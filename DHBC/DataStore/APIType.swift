//
//  APIType.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation
import UIKit

protocol APIType {

}

extension APIType {
    func userAgent() -> String {
        let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName")!
        let bundleVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")!
        let systemName = UIDevice.current.systemName
        let systemVersion = UIDevice.current.systemVersion
        return "\(bundleName)/\(bundleVersion) \(systemName)/\(systemVersion)"
    }
    
    func getCommonHeader() -> [String: String] {
        return ["User-Agent": userAgent()]
    }
    
    func getCommonParam() -> [String: Any] {
        let uuid = "uuid"
        return [
            "uuid": uuid,
            "os": Define.Api.os
        ]
    }
}

