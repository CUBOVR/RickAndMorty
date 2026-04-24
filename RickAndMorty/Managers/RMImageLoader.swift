//
//  ImageManager.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 24/04/26.
//

import Foundation

final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageCache = NSCache<NSString, NSData>()
    
    private init (){}
    
    public func downloadImage(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageCache.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self?.imageCache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
