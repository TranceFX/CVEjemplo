//
//  CVHeaderView.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

class CVHeaderView: UIView{
    
    var heightLayoutConstraint = NSLayoutConstraint()
    var bottomLayoutConstraint = NSLayoutConstraint()
    
    var containerView = UIView()
    var containerLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.red
        self.addSubview(containerView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|",
                                                           options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                           metrics: nil,
                                                           views: ["containerView" : containerView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[containerView]|",
                                                           options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                           metrics: nil,
                                                           views: ["containerView" : containerView]))
        containerLayoutConstraint = NSLayoutConstraint(item: containerView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .height,
                                                       multiplier: 1.0,
                                                       constant: 0.0)
        self.addConstraint(containerLayoutConstraint)
        
        //Background Image
        let imageView: UIImageView = UIImageView.init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage.init(named: "header")
        
        //Foreground Image
        let imageForeground:UIImageView = UIImageView.init()
        imageForeground.translatesAutoresizingMaskIntoConstraints = false
        imageForeground.backgroundColor = UIColor.clear
        imageForeground.clipsToBounds = true
        imageForeground.contentMode = .scaleAspectFit
        imageForeground.image = UIImage.init(named: "logo")
        
        //Add Foreground Image
        imageView.addSubview(imageForeground)
        
        //Constraints Foreground Image
        let constX:NSLayoutConstraint = NSLayoutConstraint(item: imageForeground,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: imageView, attribute: NSLayoutConstraint.Attribute.centerX,
                                                           multiplier: 1,
                                                           constant: 0);
        imageView.addConstraint(constX);
        
        let constY:NSLayoutConstraint = NSLayoutConstraint(item: imageForeground,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: imageView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           multiplier: 1,
                                                           constant: 0);
        imageView.addConstraint(constY);
        
        let constW:NSLayoutConstraint = NSLayoutConstraint(item: imageForeground,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: nil,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           multiplier: 1,
                                                           constant: 251);
        imageForeground.addConstraint(constW);
        
        let constH:NSLayoutConstraint = NSLayoutConstraint(item: imageForeground,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: nil,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           multiplier: 1,
                                                           constant: 174);
        imageForeground.addConstraint(constH);
        
        //Add Background
        containerView.addSubview(imageView)
        
        //Constraints BackgroundImage
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|",
                                                                    options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                    metrics: nil,
                                                                    views: ["imageView" : imageView]))
        
        bottomLayoutConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .bottom,
                                                    relatedBy: .equal,
                                                    toItem: containerView,
                                                    attribute: .bottom,
                                                    multiplier: 1.0,
                                                    constant: 0.0)
        containerView.addConstraint(bottomLayoutConstraint)
        
        heightLayoutConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: containerView,
                                                    attribute: .height,
                                                    multiplier: 1.0,
                                                    constant: 0.0)
        containerView.addConstraint(heightLayoutConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerLayoutConstraint.constant = scrollView.contentInset.top;
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top);
        containerView.clipsToBounds = offsetY <= 0
        bottomLayoutConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
        heightLayoutConstraint.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
