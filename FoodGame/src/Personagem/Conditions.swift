//
//  Conditions.swift
//  FoodGame
//
//  Created by Felipe Ferreira on 15/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class conditions: UIViewController{
    
    @IBOutlet var temDiab: UIButton!
    @IBOutlet var temHipe: UIButton!
    @IBOutlet var temInto: UIButton!
    @IBOutlet var isVege: UIButton!
    @IBOutlet var temGast: UIButton!
    @IBOutlet var isGlut: UIButton!
    let defaults = UserDefaults.standard
    @IBOutlet weak var bttSalva: UIButton!
    var nome: name = name()
    var idade: age = age()
    var sexo: sex = sex()
    var dicionario: [String: Bool] = ["Diabetes": false, "Hipertensao": false, "Lactose": false, "Vegetariano": false, "Gastrite": false, "Gluten": false]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualBotao(sender: bttSalva)
    }
    
    @IBAction func checkDiabetes(_ sender: Any) {
        if temDiab.isSelected {
            temDiab.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Diabetes")
        } else {
            temDiab.isSelected = true
            print("on")
            dicionario.updateValue(true, forKey: "Diabetes")
        }
    }
    
    @IBAction func checkHiper(_ sender: UIButton) {
        if temHipe.isSelected {
           temHipe.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Hipertensao")
            } else {
                temHipe.isSelected = true
                print("on")
                dicionario.updateValue(true, forKey: "Hipertensao")
                }
    }
    
    @IBAction func checkIntolerante(_ sender: UIButton) {
        if temInto.isSelected {
        temInto.isSelected = false
         print("off")
         dicionario.updateValue(false, forKey: "Lactose")
         } else {
             temInto.isSelected = true
             print("on")
            dicionario.updateValue(true, forKey: "Lactose")
             }
    }
    
    @IBAction func checkVeggie(_ sender: UIButton) {
        if isVege.isSelected {
            isVege.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Vegetariano")
         } else {
             isVege.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Vegetariano")
             }
    }
    
    @IBAction func checkGastrite(_ sender: UIButton) {
        if temGast.isSelected {
            temGast.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Gastrite")
         } else {
             temGast.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Gastrite")
             }
    }
    
    @IBAction func checkGluten(_ sender: UIButton) {
        if isGlut.isSelected {
            isGlut.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Gluten")
         } else {
             isGlut.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Gluten")
             }
        
    }
    
 
    @IBAction func bttSalvar(_ sender: UIButton) {
        
        print(defaults.string(forKey: "Nome")!)
        print(defaults.integer(forKey: "Idade"))
        print(defaults.string(forKey: "Sexo")!)
        defaults.set(dicionario, forKey: "Condicoes")
        
        print(dicionario["Diabetes"]!)
        print(dicionario["Hipertensao"]!)
        print(dicionario["Lactose"]!)
        print(dicionario["Vegetariano"]!)
        print(dicionario["Gastrite"]!)
        print(dicionario["Gluten"]!)
      
        performSegue(withIdentifier: "Game", sender: nil)
    }
    
}
