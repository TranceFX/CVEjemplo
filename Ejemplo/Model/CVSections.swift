//
//  CVSections.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

class CVSections: Decodable{
    var sections: [CVSectionData]?
}

struct CVSectionData: Decodable{
    var nameSection: String?
    var sectionURL: String?
    var displayName: String?
}
