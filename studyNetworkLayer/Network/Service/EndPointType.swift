//
//  EndPointType.swift
//  studyNetworkLayer
//
//  Created by Alcides Junior on 05/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

protocol EndPointType{
    var baseURL: URL{ get }
    var path: String{ get }
    var httpMethod: HTTPMethod{ get }
    var task: HTTPTask{ get }
    var headers: HTTPHeaders?{ get }
}
