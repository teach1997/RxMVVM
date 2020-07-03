//
//  EtcInject.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Swinject
import RxSwift
import EventKit

final class EtcInject {
    static let shared = EtcInject()
    let container = Container()
    
    private init() {
        container.register(DisposeBag.self) { _ in
            DisposeBag()
        }
        
        container.register(Date.self) { _ in
            Date()
        }
        
        container.register(EKEventStore.self) { _ in
            EKEventStore()
        }
    }
}
