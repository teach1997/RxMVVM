//
//  ViewControllerViewModel.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewControllerViewModelInputs {
    var inputEmail: BehaviorRelay<String> { get }
    var inputPassword: BehaviorRelay<String> { get }
}

protocol ViewControllerViewModelOutPuts {
    var loginStatus: PublishSubject<LoginResponse> { get }
    var messageError: PublishSubject<String> { get }
    func handleLogin()
}

protocol ViewControllerViewModelType {
    var inputs: ViewControllerViewModelInputs { get }
    var outputs: ViewControllerViewModelOutPuts { get }
}

class ViewControllerViewModel: ViewControllerViewModelType, ViewControllerViewModelInputs, ViewControllerViewModelOutPuts {
    
    var inputs: ViewControllerViewModelInputs { return self }
    var outputs: ViewControllerViewModelOutPuts { return self }
    private var disposeBag = DisposeBag()

    //MARK: - ViewControllerViewModelInputs
    var inputEmail = BehaviorRelay<String>(value: "")
    
    var inputPassword = BehaviorRelay<String>(value: "")
    
    //MARK: - ViewControllerViewModelOutPuts
    
    var loginStatus = PublishSubject<LoginResponse>()
    
    var messageError = PublishSubject<String>()
    
    func handleLogin() {
        let handleLoginObserver = APISession.shared.callApi(account: Account(email: inputEmail.value, password: inputPassword.value))
        handleLoginObserver.subscribe { (response) in
            do {
                switch response {
                case .success(let data):
                    let responseData = try JSONDecoder().decode(LoginResponse.self, from: data)
                    self.loginStatus.onNext(responseData)
                case .error(let error):
                    self.messageError.onNext("Have Error")
                }
            } catch {
                self.messageError.onNext("Have Error")
            }
        }
    }
    
}

