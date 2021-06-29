//
//  NYTimesApi.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation
import Moya

enum NYTimesAPI {
    case getTopStories
}

extension NYTimesAPI: TargetType {
    var baseURL: URL { return URL(string: BASE_URL)! }
    
    var path: String {
        switch self {
        case .getTopStories:
            return "svc/topstories/v2/home.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTopStories:
            return .get
        }
    }
    
    var sampleData: Data {
        do{
            guard let url = Bundle.main.url(forResource: "StoryMock", withExtension: "json") else { return Data() }
            let data = try Data(contentsOf: url)
            return data
        }catch{
            print(error)
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getTopStories:
            let parameters: [String: Any] = ["api-key": API_KEY]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json",
        "Content-Type": "application/json"]
    }
}

