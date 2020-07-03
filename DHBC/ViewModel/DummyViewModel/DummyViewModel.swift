//
//  ViewModelDummy.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import RxSwift

protocol DummyViewModelInputs {
}

protocol DummyViewModelOutputs {
}

protocol DummyViewModelType {
    var input: DummyViewModelInputs { get }
    var output: DummyViewModelOutputs { get }
}

class DummyViewModel: DummyViewModelType, DummyViewModelInputs, DummyViewModelOutputs {
    
    var input: DummyViewModelInputs { return self }
    var output: DummyViewModelOutputs { return self }
    
    var disposeBag: DisposeBag
    var model: IDummyModel
    
    init(disposeBag: DisposeBag!, model: IDummyModel!) {
        self.disposeBag = disposeBag
        self.model = model
    }
    
    
}
