//
//  NetworkError.swift
//  studyNetworkLayer
//
//  Created by Alcides Junior on 05/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error{
    case parameterNil = "Parameters were nil."
    case encodingFailed = "Parameters encoding failed."
    case missingURL = "URL is nil."
}
