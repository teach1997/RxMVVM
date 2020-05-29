//
//  ViewController.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewmodel: ViewControllerViewModelType!
    var disposePag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel = ViewControllerViewModel()
        
        emailTextField.rx.text.map{$0 ?? "" }
            .bind(to: viewmodel.inputs.inputEmail)
            .disposed(by: disposePag)
        passwordTextField.rx.text.map{$0 ?? ""}
            .bind(to: viewmodel.inputs.inputPassword)
            .disposed(by: disposePag)
        loginButton.rx.tap
            .asDriver(onErrorDriveWith: Driver.empty())
            .drive(onNext: {[weak self] _ in
                self?.viewmodel.outputs.handleLogin()
            }).disposed(by: disposePag)
        viewmodel.outputs.loginStatus.subscribe { (event) in
            self.showToast(message: event.element?.message.data ?? "")
        }
        viewmodel.outputs.messageError.subscribe { (event) in
            self.showToast(message: event.element ?? "")
        }
    }
}
