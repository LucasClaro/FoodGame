//
//  PerfilTableVC.swift
//  FoodGame
//
//  Created by Lucas Claro on 05/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class PerfilTableVC: UITableViewController {
    
    var condicoes: [String] = []
    var descricoes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pegarCondicoes()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1;
        }
        
        return condicoes.count;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
            case 0:
                sectionName = NSLocalizedString("", comment: "Informações do perfil")
            case 1:
                sectionName = NSLocalizedString("Condições de saúde", comment: "Condições de saúde do usuário")
            default:
                sectionName = ""
        }
        return sectionName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var customCell: UITableViewCell
        
        customCell = tableView.dequeueReusableCell(withIdentifier: "CellPerfil")!
        
        customCell.textLabel?.text = UserDefaults.standard.string(forKey: "Nome")
        customCell.detailTextLabel?.text = String(UserDefaults.standard.integer(forKey: "Idade")) + " anos"
        //customCell.imageView?.image = ...
        
        
        if(indexPath.section > 0){
            customCell = tableView.dequeueReusableCell(withIdentifier: "CellCondicao")!
            customCell.textLabel?.text = condicoes[indexPath.row]
            customCell.detailTextLabel?.text = descricoes[indexPath.row]
            
        }
        
        return customCell
    }
    
    func pegarCondicoes(){
        let dicionario = ((UserDefaults.standard.dictionary(forKey: "Condicoes") as? [String: Bool])!)
        
        for (key, value) in dicionario{
            switch key{
            case "Diabetes":
                if(value){
                    condicoes.append("Diabetes")
                    descricoes.append("lorenD")
                }
            case "Hipertensao":
                if(value){
                    condicoes.append("Hipertensao");
                    descricoes.append("lorenH")
                }
            case "Lactose":
                if(value){
                    condicoes.append("Lactose");
                    descricoes.append("lorenL")
                }
            case "Vegetariano":
                if(value){
                    condicoes.append("Vegetariano");
                    descricoes.append("lorenV")
                }
            case "Gastrite":
                if(value){
                    condicoes.append("Gastrite");
                    descricoes.append("lorenG")
                }
            case "Gluten":
                if(value){
                    condicoes.append("Gluten");
                    descricoes.append("lorenG")
                }
            default:
                print("default")
            }
        }
    }
}
