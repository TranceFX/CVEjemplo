//
//  CVJobCell.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

class CVJobCell: UITableViewCell{
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var role: UILabel?
    @IBOutlet weak var type: UILabel?
    @IBOutlet weak var start: UILabel?
    @IBOutlet weak var end: UILabel?
    @IBOutlet weak var detail: UILabel?
    
    var job: CVJobData? {
        didSet {
            name?.text = job?.nameJob
            role?.text = job?.roleJob
            type?.text = job?.typeJob
            start?.text = job?.startJob
            end?.text = job?.endJob
            detail?.text = job?.detailJob
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
