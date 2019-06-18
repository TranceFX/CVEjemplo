//
//  CVUser.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

class CVUser: Decodable{
    var name: String?
    var lastName: String?
    var birthDay: String?
    var profileImage: String?
    var address: CVAddress?
    var contact: CVContact?
    var skills: CVSummary?
}

struct CVAddress: Decodable{
    var streetAddress: String?
    var city: String?
    var state: String?
    var cpCode: Int?
}

struct  CVContact: Decodable{
    var email: String?
    var phoneNumber: Int?
}

struct CVSummary: Decodable {
    var basic: [String]?
    var advanced: [String]?
}
