//
//  NetworkManager.swift
//  studyNetworkLayer
//
//  Created by Alcides Junior on 06/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

struct NetworkManager{
    
    static let environment: NetworkEnvironment = .production
    static let MovieAPIKey = "PUT YOUR KEY HERE"
    private let router = Router<MovieApi>()
    
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse)->Result<String>{
        switch response.statusCode {
        case 200...209:
            return .success
        case 401...500:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
            
        }
    }
    
    func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?,_ error: String? )->()){
        router.request(.newMovies(page: page)) { (data, response, error) in
            if error != nil{
                completion(nil,"Please, check your connection!")
            }
            
            if let response = response as? HTTPURLResponse{
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else{return}
                    do{
                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                        completion(apiResponse.movies, nil)
                    }catch{
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}

enum NetworkResponse: String{
    
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}


