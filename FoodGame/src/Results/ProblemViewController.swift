//
//  ProblemViewController.swift
//  FoodGame
//
//  Created by Igor Kenzo Miyamoto Dias on 06/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController {
    @IBOutlet weak var scrollViewCondicoes: UIScrollView!
    @IBOutlet weak var lblCondicoes: UILabel!
    
    @IBAction func voltarClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var btnvolta: UIButton!
    var texto : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewCondicoes.contentLayoutGuide.bottomAnchor.constraint(equalTo: lblCondicoes.bottomAnchor).isActive = true
        
        btnvolta.layer.cornerRadius = 30
        
        for s in texto{
            if !s.hasSuffix("comer "){
                lblCondicoes.text! += s.prefix(s.count-2) + ".\n"
            }
        }
        
    }

}
