//
//  CVMockModel.swift
//  EjemploTests
//
//  Created by Juan Casillas Juarez on 6/17/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

struct JSONTEST {
    static let SUCCESS = """
{
            "sections" : [
            {"nameSection" : "userInfo",
            "displayName" : "My Information",
            "sectionURL" : "https://raw.githubusercontent.com/TranceFX/exampleCV/master/userInfo.json"
            },
            {"nameSection" : "jobInfo",
            "displayName" : "My Career",
            "sectionURL" : "https://raw.githubusercontent.com/TranceFX/exampleCV/master/jobInfo.json"
            }
            ]
        }
"""
    static let FAILURE = "{}"
    static let ERROR = ""
}
