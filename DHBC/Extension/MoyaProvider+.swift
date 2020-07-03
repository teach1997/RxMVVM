//
//  MoyaProvider+.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Moya
import RxSwift

enum APIError: Error {
    case network
    case server(ErrorResponse)
    case decode
    case unknown(String)
    
    var title: String {
        return "Error"
    }
    
    var message: String {
        switch self {
        case .network: return "Disconnect networks"
        case .server(let error): return error.info
        case .decode: return "Failed to decode the data"
        case .unknown(let message): return message
        }
    }
}

extension Reactive where Base: MoyaProviderType {
    func requestMakeCodeError(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Single<Response> {
        return Single.create { [weak base] single in
            let cancellableToken = base?.request(token, callbackQueue: callbackQueue, progress: nil) { result in
                switch result {
                case let .success(response):
                    guard response.statusCode == 200 else {
                        do {
                            let error = try JSONDecoder().decode(ErrorInfo.self, from: response.data)
                            return single(.error(APIError.server(error.response)))
                        } catch {
                            return single(.error(APIError.unknown("Have error!!")))
                        }
                    }
                    single(.success(response))
                case .failure:
                    single(.error(APIError.network))
                }
            }
            
            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
    }
}


