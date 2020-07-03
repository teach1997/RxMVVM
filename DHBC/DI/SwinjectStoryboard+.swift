//
//  SwinjectStoryboard+.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import RxSwift
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        let container = defaultContainer
        let viewModelInject = ViewModelInject.shared
        
        //viewController
        container.storyboardInitCompleted(DummyViewController.self) { (_, controller) in
            controller.viewmodel = viewModelInject.container.resolve(DummyViewModel.self)
        }
    }
}
