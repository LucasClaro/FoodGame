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
    var textos: [[String]] = []
    var legendas: [String] = []
    
    var mealDict : [String:Meal] = [:]
     
    var currentMeal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preencherTextos()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return textos.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textos[section].count
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let sectionName: String
        switch section {
            case 0:
                sectionName = NSLocalizedString("mySectionName", comment: "mySectionName")
            case 1:
                sectionName = NSLocalizedString("myOtherSectionName", comment: "myOtherSectionName")
            // ...
            default:
                sectionName = ""
        }
        return sectionName
    }*/
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
            case 0:
                sectionName = NSLocalizedString("Informações", comment: "Informações do prato")
            case 1:
                sectionName = NSLocalizedString("Alimentos", comment: "Alimentos no prato")
            default:
                sectionName = ""
        }
        return sectionName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PratoCell
        
        customCell.textLabel?.text = textos[indexPath.section][indexPath.row]
        customCell.detailTextLabel?.text = "";
        
        if(indexPath.section > 0){
            customCell.detailTextLabel?.text = legendas[indexPath.row]
            customCell.imageView?.image = UIImage(named: alimentos[indexPath.row].foto)
        }
        
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    func preencherTextos(){
        let infos = ["Refeição: " + currentMeal,
                     "Carboidrato: \(mealDict[currentMeal]!.carbohydrates)g/\(Calculo.maxValue.gCarbo)",
                     "Proteinas: \(mealDict[currentMeal]!.proteins)g/\(Calculo.maxValue.gProt)",
                     "Vegetais: \(mealDict[currentMeal]!.vegetables)g/\(Calculo.maxValue.gVeg)"]
        var nomes: [String] = []
        
        textos.append(infos)
        
        for a in alimentos {
            nomes.append(a.nome)
            legendas.append(String(a.porcao) + " gramas de " + a.tipo)
        }
        
        textos.append(nomes);
    }
}
