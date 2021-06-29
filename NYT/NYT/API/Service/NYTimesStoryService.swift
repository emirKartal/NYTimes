//
//  NYTimeStoryService.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation
import Moya

class NYTimesStoryService: ServiceProtocol {
    var provider: MoyaProvider<NYTimesAPI>!
    
    required init(isMock: Bool) {
        if isMock {
            provider = MoyaProvider<NYTimesAPI>(stubClosure: MoyaProvider.immediatelyStub, plugins: self.moyaPlugins())
        } else {
            provider = MoyaProvider<NYTimesAPI>(stubClosure: MoyaProvider.neverStub, plugins: self.moyaPlugins())
        }
    }
    
    func getTopStories(completion: @escaping(Result<StoryModel, APIError>)->()) {
        self.provider.request(.getTopStories) { result in
            switch result {
            case .success(let response):
                if let story = response.parseCodableModel(type: StoryModel.self) {
                    completion(.success(story))
                }else {
                    completion(.failure(.parseError))
                }
                break
            case .failure(let error):
                let errorMessage = self.getResponseError(from: error)
                completion(.failure(errorMessage))
                break
            }
        }
    }
}
