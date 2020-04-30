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
        navigationController?.navigationBar.isHidden = true
        popupView.layer.cornerRadius = 30
    }
    
    @IBAction func resume(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sair(_ sender: Any) {
        let alert = UIAlertController(title: "Deseja mesmo sair?", message: "Saindo você perderá todo o progresso atual", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.performSegue(withIdentifier: "unwindToMenu", sender: nil)}))
      alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func reiniciar(_ sender: Any) {
        let alert = UIAlertController(title: "Deseja mesmo Reiniciar?", message: "Reiniciando você recomeçará a refeição atual", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.performSegue(withIdentifier: "unwindWithSegue", sender: nil)}))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        self.present(alert, animated: true)
    }
}
