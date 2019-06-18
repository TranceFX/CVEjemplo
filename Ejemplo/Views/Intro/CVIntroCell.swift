//
//  CVIntroCell.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

class CVIntroCell: UITableViewCell{
    @IBOutlet weak var nameSection: UILabel?
    
    var section: CVSectionData? {
        didSet {
            nameSection?.text = section?.displayName
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
