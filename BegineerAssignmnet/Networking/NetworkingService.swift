//
//  NetworkingService.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class NetworkingService {
  private let sessionManager: Alamofire.Session
  private let requestQueue: DispatchQueue
  
  init(
    configuration: URLSessionConfiguration = .default,
    requestQueue: DispatchQueue = DispatchQueue(label: "myAssignment.alamofireQueue")
  ) {
    self.sessionManager = Alamofire.Session(configuration: configuration)
    self.requestQueue = requestQueue
  }
}

extension NetworkingService: Networking {
  // 당연히 제
  func requestObservable<Response>(
    _ endpoint: Endpoint<Response>
  ) -> Observable<Response> {
    sessionManager.rx.request(
      endpoint.method,
      endpoint.url,
      parameters: endpoint.parameters,
      encoding: endpoint.encoding,
      headers: endpoint.headers
    )
    .responseData()
    .flatMapLatest { response, data -> Observable<Response> in
      print("[\(Date())] \(String(describing: response.url))", response.statusCode)
      
      do {
        let response = try endpoint.decode(data)
        return .just(response)
      }
      catch(let err) {
        print("[\(Date())] \(String(describing: response.url))", err.localizedDescription, #line, #function)
        return .empty()
      }
    }
  }
  
  func request<Response>(
    _ endpoint: Endpoint<Response>,
    then completion: @escaping (Result<Response, Error>) -> Void
  ) {
    let request = sessionManager.request(
      endpoint.url,
      method: endpoint.method,
      parameters: endpoint.parameters,
      encoding: endpoint.encoding,
      headers: endpoint.headers
    )
    
    request
      .validate(statusCode: 200...299)
      .responseData(queue: requestQueue) { response in
        switch response.result {
        case let .success(response):
          do {
            let response = try endpoint.decode(response)
            completion(.success(response))
          }
          catch(let err) {
            print(err.localizedDescription, #line)
          }
        case let .failure(err):
          completion(.failure(err))
        }
      }
  }
}
