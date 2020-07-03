//
//  ModelInject.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Swinject
import RxSwift

final class ModelInject {
    static let shared = ModelInject()
    let container = Container()
    
    private init() {
        let etcInject = EtcInject.shared
        let repositoryInject = RepositoryInject.shared
        
        container.register(DummyModel.self) { _ in
            DummyModel(repository: repositoryInject.container.resolve(DummyRepository.self), disposeBag: etcInject.container.resolve(DisposeBag.self))
        }
    }
    
    
}
