//
//  DataStoreInject.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Swinject
import RxSwift
import Moya
import EventKit

final class DataStoreInject {
    static let shared = DataStoreInject()
    let container = Container()
    
    private init() {
        let etcInject = EtcInject.shared
        
        //api
        registApi(with: DummyAPI.self, container: container)
        
        container.register(DummyDataStore.self) { [weak self] _ in
            guard let `self` = self else { fatalError() }
            return DummyDataStore(provider: self.resolveApi())
        }
    }
    
    private func registApi<ApiType: TargetType>(with cellType: ApiType.Type, container: Container) {
        container.register(MoyaProvider<ApiType>.self) { _ in
            MoyaProvider<ApiType>()
        }
    }
    
    private func resolveApi<ApiType: TargetType>() -> MoyaProvider<ApiType>? {
        return container.resolve(MoyaProvider<ApiType>.self)
    }
}
