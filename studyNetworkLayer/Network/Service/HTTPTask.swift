//
//  HTTPTask.swift
//  studyNetworkLayer
//
//  Created by Alcides Junior on 05/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask{
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}
