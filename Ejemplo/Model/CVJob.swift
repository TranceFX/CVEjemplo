//
//  CVJob.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

class CVJob: Decodable{
    var jobs: [CVJobData]?
}

struct CVJobData: Decodable {
    var nameJob: String?
    var startJob: String?
    var endJob: String?
    var typeJob: String?
    var roleJob: String?
    var detailJob: String?
    var techData: String?
}
