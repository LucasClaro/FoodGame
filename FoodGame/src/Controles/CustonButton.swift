//
//  CustonButton.swift
//  FoodGame
//
//  Created by Lucas Claro on 13/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class CustonButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        desenharBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        desenharBtn()
    }
    
    private func desenharBtn(){
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        
        layer.cornerRadius = 10
    }
    
}
