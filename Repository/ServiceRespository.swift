//
//  ServiceRespository.swift
//  DemoTest
//
//  Created by Israrul on 3/15/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

enum NetworkError:Error {
    case malformedURL(message:String)
    case errorWith(response:URLResponse?)
    case dataParsinFailed
}

typealias completionHandler<DataModel:Decodable> = (Result<DataModel , NetworkError>) -> Void
typealias imageDownlaodCompletionHandler = (Data?, NetworkError?) -> Void

protocol  ServiceProtocol {
    associatedtype DataModel: Decodable
    func fetchDataFrom(baseUrl:String, path:String, parameters:String, completion:  @escaping completionHandler<DataModel>)
    
    func downloadImageFrom(url:String, completion:@escaping imageDownlaodCompletionHandler)
}

class Service<Model:Decodable>:ServiceProtocol, GenericJsonDecoder {
    typealias DataModel = Model
    let urlSesson = URLSession(configuration: .default)
    var dataTask:URLSessionDataTask?
    func fetchDataFrom(baseUrl: String, path: String, parameters: String, completion: @escaping (Result<Model, NetworkError>) -> Void) {
        dataTask?.cancel()
        guard var urlComponents = URLComponents(string:baseUrl + path) else {
            completion(.failure(.malformedURL(message:"URL is not correct")))
            return
        }
        urlComponents.query = "\(parameters)"
        guard let url = urlComponents.url else {
            completion(.failure(.malformedURL(message:"URL is nil")))
            return
        }
        dataTask =  urlSesson.dataTask(with:url) { (data, responce, error)  in
            guard let data = data , let _responce = responce as? HTTPURLResponse , _responce.statusCode == 200 else {
                completion(.failure(.errorWith(response: responce)))
                return
            }
            if let tracks =  self.decode(input: data) {
                completion(.success(tracks))
            }else {
                completion(.failure(.dataParsinFailed))
            }
        }
        dataTask?.resume()
    }
    
    func downloadImageFrom(url: String, completion: @escaping imageDownlaodCompletionHandler) {
          let urlSesson = URLSession(configuration: .default)
          guard let urlComponents = URLComponents(string:url) else {
              completion(nil, .malformedURL(message:"URL is not correct"))
              return
          }
          guard let url = urlComponents.url else {
              completion(nil, .malformedURL(message:"URL is nil"))
              return
          }
          dataTask =  urlSesson.dataTask(with:url) { (data, responce, error)  in
              guard let data = data , let _responce = responce as? HTTPURLResponse , _responce.statusCode == 200 else {
                  completion(nil, .errorWith(response:responce))
                  return
              }
            completion(data, nil)

          }
          dataTask?.resume()
      }
}

