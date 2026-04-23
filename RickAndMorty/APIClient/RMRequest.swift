//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 21/04/26.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    
    private let pathComponents: Set<String>
    
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in string format
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            let joinedPathComponents = pathComponents.joined(separator: "/")
            string += "/\(joinedPathComponents)"
        }
        
        if !queryParameters.isEmpty {
            let joinedQueryParameters = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"}).joined(separator: "&")
            string += "?\(joinedQueryParameters)"
        }
        
        return string
    }
    
    public var url:URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
