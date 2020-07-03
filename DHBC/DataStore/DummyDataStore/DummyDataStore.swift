//
//  DataStoreDummy.swift
//  DHBC
//
//  Created by Kiều anh Đào on 7/3/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import RxSwift
import Moya

protocol IDummyDataStore {
    func load(param: String) -> Single<String>
}

class DummyDataStore: IDummyDataStore {
    
    private let provider: MoyaProvider<DummyAPI>
    
    init (provider: MoyaProvider<DummyAPI>!) {
        self.provider = provider
    }
    
    func load(param: String) -> Single<String> {
        return provider.rx.requestMakeCodeError(.callAPI(param: param))
            .map(String.self)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
    }
}

enum DummyAPI {
    case callAPI(param: String)
}

extension DummyAPI: TargetType, APIType {
    var baseURL: URL {
        return URL(string: Define.Api.baseUrl)!
    }
    
    var path: String {
        return "/dummy"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .callAPI(let param):
            var params: [String: Any] = [
                "id": "dummy"
            ]
            return .requestParameters(parameters: params.union(other: getCommonParam()), encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        return ["key": "Value"]
    }
}
