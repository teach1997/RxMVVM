//
//  APISession.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class APISession {
    public static var shared = APISession()
    
    typealias response = Single<Data>
    
    func callApi(account: Account) -> response {
        
        let path = "/cashier/login"
        
        return Single.create { [weak self] single in
            let request = AF.request(URL(string: Define.Api.baseUrl + path)!, method: .post, parameters: account.param, encoding: JSONEncoding.default).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    single(.success(data))
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
