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
        let alert = UIAlertController(title: NSLocalizedString("confirmaSair", comment: "Confirmação para sair"), message: NSLocalizedString("sairAviso", comment: "Aviso sobre sair"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in self.performSegue(withIdentifier: "unwindToMenu", sender: nil)}))
      alert.addAction(UIAlertAction(title: NSLocalizedString("cancelar", comment: "Cancelar opção"), style: .destructive, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func reiniciar(_ sender: Any) {
        let alert = UIAlertController(title: NSLocalizedString("confirmaReinicio", comment: "Confirmação para reiniciar"), message: NSLocalizedString("reinicioAviso", comment: "Aviso sobre reiniciar"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in self.performSegue(withIdentifier: "unwindWithSegue", sender: nil)}))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        
        self.present(alert, animated: true)
    }
}
