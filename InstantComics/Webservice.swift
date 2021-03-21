//
//  Webservice.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 16/03/2021.
//

import Combine
import Foundation
import SwiftUI

//Enum to define error messaging
enum NetworkError: Error, LocalizedError, Identifiable {

    case urlError
    case getDataError
    case decodingError
    
    var id: String { localizedDescription }
    
    var errorDescription: String? {
        switch self {
        case .urlError: return "Something wrong with the url"
        case .getDataError: return "No data"
        case .decodingError: return "Fail to decode"
        }
    }
}

struct Webservice {
    
    func getCurrentComic(url: String, completion: @escaping (Result<ComicsResponse, NetworkError>) -> Void) {
        
        guard let url = URL(string: url ) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.getDataError))
                    return
                }
                
                let decoder = JSONDecoder()
                
                let comics = try? decoder.decode(ComicsResponse.self, from: data)
                
                if let comics = comics {
                    completion(.success(comics))
                } else {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
    func getSpecifiedComic(url: String, completion: @escaping (Result<ComicsResponse, NetworkError>) -> Void) {
        
        guard let url = URL(string: url ) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.getDataError))
                    return
                }
                
                let decoder = JSONDecoder()
                
                let comics = try? decoder.decode(ComicsResponse.self, from: data)
                
                if let comics = comics {
                    completion(.success(comics))
                    print(comics)
                } else {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
