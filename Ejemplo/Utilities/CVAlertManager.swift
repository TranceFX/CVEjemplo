//
//  CVAlertManager.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

typealias ActionHandler = () -> Void

class CVAlertManger{
    
    private var viewController:AnyObject!
    
    init(view:AnyObject) {
        viewController = view
    }
    
    func showAlert(title: String?, message: String?)
    {
        presentAlert(title: title, message: message, handler: nil)
    }
    
    func showAlert(title: String?, message: String?, handler: @escaping ActionHandler)
    {
        presentAlert(title: title, message: message, handler: handler)
    }
    
    private func presentAlert(title: String?, message: String?, handler: ActionHandler?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .cancel) { (alertAction) -> Void in
            handler?()
        }
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}

