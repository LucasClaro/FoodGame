//
//  EditCharacter.swift
//  FoodGame
//
//  Created by Felipe Ferreira on 22/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class edit: UIViewController{
    @IBOutlet weak var lblOla: UILabel!
    @IBOutlet weak var avisoNome: UILabel!
    @IBOutlet weak var avisoAno: UILabel!
    @IBOutlet weak var fieldNome: UITextField!
    @IBOutlet weak var fieldAno: UITextField!
    @IBOutlet weak var bttFem: UIButton!
    @IBOutlet weak var bttMasc: UIButton!
    @IBOutlet weak var bttDiab: UIButton!
    @IBOutlet weak var bttHipe: UIButton!
    @IBOutlet weak var bttLacto: UIButton!
    @IBOutlet weak var bttVege: UIButton!
    @IBOutlet weak var bttGast: UIButton!
    @IBOutlet weak var bttGlut: UIButton!
    @IBOutlet weak var bttSalva: UIButton!
    let defaults = UserDefaults.standard
    var vetorCondicoes: [String] = []
    var vetor: [String] = []
    
    override func viewDidLoad() {
        // MARK: - Set array to variable
        vetorCondicoes = (defaults.array(forKey: "Condicoes") as? [String])!
        
        // MARK: - Load screen with user name and button design
        lblOla.text = "Olá \(defaults.string(forKey: "Nome") ?? "Usuário")." + "\nEdite seu personagem: "
        visualBotao(sender: bttSalva)
        
        // MARK: - Make the warning labels hidden by default
        avisoNome.isHidden = true
        avisoAno.isHidden = true
        
        // MARK: - Loading data
        loadData()
        
    }
    
    func loadData(){
        fieldNome.text = defaults.string(
        forKey: "Nome")
        
        fieldAno.text = defaults.string(forKey: "Ano")
        
        switch defaults.string(forKey: "Sexo"){
        case "F":
            bttFem.isSelected = true
            break
        case "M":
            bttMasc.isSelected = true
            break
        default:
            print("Nenhuma")
        }
        
        for i in
            0..<vetorCondicoes.count{
            print(vetorCondicoes[i])
                switch vetorCondicoes[i] {
                case "1":
                    bttDiab.isSelected = true
                    break
                case "2":
                    bttHipe.isSelected = true
                    break
                case "3":
                    bttLacto.isSelected = true
                    break
                case "4":
                    bttVege.isSelected = true
                    break
                case "5":
                    bttGast.isSelected = true
                    break
                case "6":
                    bttGlut.isSelected = true
                    break
                default:
                    print("Nenhuma")
                }
        }
    }
    
    
    @IBAction func checkDiabetes(_ sender: UIButton) {
        if bttDiab.isSelected {
            bttDiab.isSelected = false
            print("off")
            if let index = vetor.firstIndex(of: "1"){
            vetor.remove(at: index)
            print("Removido")
            }
        } else {
            bttDiab.isSelected = true
            print("on")
            vetor.append("1")
        }
    }
    
    @IBAction func checkHiper(_ sender: UIButton) {
        if bttHipe.isSelected {
        bttHipe.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "2"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             bttHipe.isSelected = true
             print("on")
             vetor.append("2")
             }
    }
    
    @IBAction func checkLacto(_ sender: Any) {
        if bttLacto.isSelected {
        bttLacto.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "3"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             bttLacto.isSelected = true
             print("on")
             vetor.append("3")
             }
    }
    
    @IBAction func checkVeggie(_ sender: UIButton) {
        if bttVege.isSelected {
        bttVege.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "4"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             bttVege.isSelected = true
             print("on")
             vetor.append("4")
             }
    }
    
    @IBAction func cbeckGast(_ sender: UIButton) {
        if bttGast.isSelected {
        bttGast.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "5"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             bttGast.isSelected = true
             print("on")
             vetor.append("5")
             }
    }
    
    @IBAction func checkGlut(_ sender: UIButton) {
        if bttGlut.isSelected {
        bttGlut.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "6"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             bttGlut.isSelected = true
             print("on")
             vetor.append("6")
             }
    }
    
    @IBAction func bttSalvar(_ sender: UIButton) {
        defaults.set(vetor, forKey: "Condicoes")
        print("Salvo")
    }
    
}
