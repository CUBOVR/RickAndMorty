//
//  RMService.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 21/04/26.
//

import Foundation

/// Primary API service object to get data
final class RMService {
    
    /// Share singleton instance
    static let shared = RMService()
    
    /// Privatize constructor
    private init() {
        
    }
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest,expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil}
        var request = URLRequest(url: url)
        
         request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
