//
//  Dictionary+.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

public extension Dictionary {
    public func union(other: Dictionary) -> Dictionary {
        var tmp = self
        other.forEach { tmp[$0.0] = $0.1 }
        return tmp
    }
}
