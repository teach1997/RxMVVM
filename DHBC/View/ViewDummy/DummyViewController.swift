//
//  DummyViewController.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DummyViewController: UIViewController {

    var viewmodel: DummyViewModelType!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customBackground()
    }
}
