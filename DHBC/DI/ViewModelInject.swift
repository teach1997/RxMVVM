//
//  ViewModelInject.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Swinject
import RxSwift

final class ViewModelInject {
    static let shared = ViewModelInject()
    let container = Container()
    
    private init() {
        let etcInject = EtcInject.shared
        let modelInject = ModelInject.shared
        
        container.register(DummyViewModel.self) { _ in
            DummyViewModel(disposeBag: etcInject.container.resolve(DisposeBag.self), model: modelInject.container.resolve(DummyModel.self))
        }
        
    }
}


