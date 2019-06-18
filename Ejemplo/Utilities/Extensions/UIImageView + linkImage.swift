//
//  UIImage + linkImage.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import UIKit

extension UIImageView{
    
    /// Returns an image from a url
    ///
    /// - Parameter:
    ///     - urlLink: The link to the image
    
    func getImageFrom(urlLink: String?){
        guard let link = URL(string: urlLink ?? "") else { return }
        URLSession.shared.dataTask(with: link, completionHandler: { (data, _,error) -> Void in
            guard let dataImage = data else{ return }
            DispatchQueue.main.async {
                if let imageContent = UIImage.init(data: dataImage){
                    self.image = imageContent
                }
            }
        }).resume()
    }
}
