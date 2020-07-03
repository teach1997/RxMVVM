//
//  RepositoryDummy.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import RxSwift

protocol IDummyRepository {
}


class DummyRepository: IDummyRepository {
    private var dataStore: IDummyDataStore
    
    init(dataStore: IDummyDataStore!) {
        self.dataStore = dataStore
    }
}
