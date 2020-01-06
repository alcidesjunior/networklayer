//
//  NetworkRouter.swift
//  studyNetworkLayer
//
//  Created by Alcides Junior on 05/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

public typealias NetWorkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetWorkRouterCompletion)
    func cancel()
}
