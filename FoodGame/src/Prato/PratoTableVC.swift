//
//  PratoTableVC.swift
//  FoodGame
//
//  Created by Lucas Claro on 23/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class PratoTableVC: UITableViewController {
    
    let alimentos: [Alimento] = [
       Alimento(id: 401, nome: "Lentilha", porcao: 100, tipo: "Proteína Vegetal", foto: "Pao"),
       Alimento(id: 402, nome: "Tofu", porcao: 100, tipo: "Proteína Vegetal", foto: "Pao"),
       Alimento(id: 403, nome: "Chia", porcao: 100, tipo: "Proteína Vegetal", foto: "Pao"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alimentos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PratoCell
        
        customCell.lblAlimento.text = alimentos[indexPath.row].nome + ", " + String(alimentos[indexPath.row].porcao) + "gramas de " + alimentos[indexPath.row].tipo
        customCell.alimentoImage.image = UIImage(named: alimentos[indexPath.row].foto)
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
}
