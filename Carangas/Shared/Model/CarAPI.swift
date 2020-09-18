//
//  CarAPI.swift
//  Carangas
//
//  Created by Eric Alves Brito on 04/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL inválida"
        default:
            return ""
        }
    }
}


class CarAPI {
    
    private static let basePath = "https://carangas.herokuapp.com/cars"
    
    private static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 30
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
        
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    static func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void) {
        guard let url = URL(string: basePath) else {
            return onComplete(.failure(.badURL))
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                let cars = try JSONDecoder().decode([Car].self, from: data)
                onComplete(.success(cars))
            } catch {
                return onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
        
    }
    
    static func createCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        request(httpMethod: .post, httpBody: car, onComplete: onComplete)
    }
    
    static func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        request(httpMethod: .delete, httpBody: car, onComplete: onComplete)
    }
    
    static func updateCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        request(httpMethod: .put, httpBody: car, onComplete: onComplete)
    }
    
    private static func request(httpMethod: HTTPMethod, httpBody: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        
        let cardID = httpBody._id ?? ""
        
        guard let url = URL(string: "\(basePath)/\(cardID)") else {
            return onComplete(.failure(.badURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = try? JSONEncoder().encode(httpBody)
        
        session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let _ = data else {
                return onComplete(.failure(.noData))
            }
            onComplete(.success(()))
        }.resume()
        
    }
}

extension CarAPI: CarAPIProtocol {}

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    
}


//Dummy
//Fake
//Stubs
//Spies
//Mocks
