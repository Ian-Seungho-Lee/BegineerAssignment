//
//  Networking.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation

protocol Networking {
  func request<Response>(_ endpoint: Endpoint<Response>, then completion: @escaping (Swift.Result<Response, Error>) -> Void)
}
