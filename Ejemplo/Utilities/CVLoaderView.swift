//
//  CVLoaderView.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

class CVLoaderView {
    
    private static let activityIndicator = UIActivityIndicatorView()
    private static let containerView = UIView()
    private static let mainWindow = UIApplication.shared.windows.first
    
    static func show()
    {
        containerView.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
        containerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint.init(x: containerView.frame.size.width/2, y: containerView.frame.size.height/2)
        containerView.addSubview(activityIndicator)
        mainWindow?.addSubview(containerView)
        activityIndicator.startAnimating()
    }
    
    static func dismiss()
    {
        DispatchQueue.main.async {
            activityIndicator.removeFromSuperview()
            containerView.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
    }
}
