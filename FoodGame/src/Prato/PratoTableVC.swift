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
    
    var alimentos: [Alimento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alimentos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PratoCell
        
        customCell.textLabel?.text = alimentos[indexPath.row].nome
        customCell.detailTextLabel?.text = String(alimentos[indexPath.row].porcao) + " gramas de " + alimentos[indexPath.row].tipo
        customCell.imageView?.image = UIImage(named: alimentos[indexPath.row].foto)
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
}
