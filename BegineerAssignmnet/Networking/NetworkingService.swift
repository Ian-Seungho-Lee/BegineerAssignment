//
//  NetworkingService.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation
import Alamofire

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

/// 추가 : RxAlamofire 아니면 Reactive Wrapper
extension NetworkingService: Networking {
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
      .responseData(queue: self.requestQueue) { response in
        
      }
  }
}
