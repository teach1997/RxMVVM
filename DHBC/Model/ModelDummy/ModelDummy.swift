//
//  ModelDummy.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import RxSwift

protocol IDummyModel {
}

class DummyModel: IDummyModel {
    let repository: IDummyRepository
    let disposeBag: DisposeBag
    
    init(repository: IDummyRepository!, disposeBag: DisposeBag!) {
        self.repository = repository
        self.disposeBag = disposeBag
    }
}
