//
//  RopositoryInject.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Swinject

final class RepositoryInject {
    static let shared = RepositoryInject()
    let container = Container()
    
    private init () {
        let dataStoreInject = DataStoreInject.shared
        
        container.register(DummyRepository.self) { _ in
            DummyRepository(dataStore: dataStoreInject.container.resolve(DummyDataStore.self))
        }
    }
}
