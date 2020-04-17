//
//  UILabel.swift
//  testStoryboard
//
//  Created by Glauber Moreira on 08/04/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//
import UIKit

extension UILabel {
    
    static func textLabel (_ size: CGFloat, textColor: UIColor = .black,textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        
        return label
    }
    
    static func textLabelBold (_ size: CGFloat, textColor: UIColor = .black, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        return label
    }
    
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false

    }
    
}
