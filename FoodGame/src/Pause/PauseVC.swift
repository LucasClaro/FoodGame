//
//  PauseVC.swift
//  FoodGame
//
//  Created by Lucas Claro on 13/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class PauseVC: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.layer.cornerRadius = 10
    }
    
    @IBAction func resume(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
