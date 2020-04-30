//
//  EditCharacter.swift
//  FoodGame
//
//  Created by Felipe Ferreira on 22/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class edit: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var lblOla: UILabel!
    @IBOutlet weak var avisoNome: UILabel!
    @IBOutlet weak var avisoAno: UILabel!
    @IBOutlet weak var fieldNome: UITextField!
    @IBOutlet weak var fieldAno: UITextField!
    @IBOutlet weak var checkMasc: UIButton!
    @IBOutlet weak var checkFem: UIButton!
    @IBOutlet weak var bttDiab: UIButton!
    @IBOutlet weak var bttHipe: UIButton!
    @IBOutlet weak var bttLacto: UIButton!
    @IBOutlet weak var bttVege: UIButton!
    @IBOutlet weak var bttGast: UIButton!
    @IBOutlet weak var bttGlut: UIButton!
    @IBOutlet weak var bttSalva: UIButton!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelEditaPersonagem: UILabel!
    var idade: Int = Int()
    let defaults = UserDefaults.standard
    var vetorCondicoes: [String] = []
    var vetor: [String] = []
    var dicionario: [String: Bool] = [:]
    
    override func viewDidLoad() {
        // MARK: - Set array to variable

        dicionario = ((defaults.dictionary(forKey: "Condicoes") as? [String: Bool])!)
        
        // MARK: - Load screen with user name and button design
        labelEditaPersonagem.text = NSLocalizedString("labelEditaPersonagem", comment: "label onde aparece texto")
        lblOla.text = NSLocalizedString("OlaNomeUser", comment: "Label para receber o usuário com o nome dele carregado") + " " +
            defaults.string(forKey: "Nome")!
        visualBotao(sender: bttSalva)
        
        // MARK: - Make the warning labels hidden by default
        avisoNome.isHidden = true
        avisoAno.isHidden = true
        
        // MARK: - Loading data
        loadData()
        
        // MARK: - Keyboard and delegation
        fieldNome.delegate = self
        fieldAno.delegate = self
        
        print(dicionario["Diabetes"]!)
        print(dicionario["Hipertensao"]!)
        print(dicionario["Lactose"]!)
        print(dicionario["Vegetariano"]!)
        print(dicionario["Gastrite"]!)
        print(dicionario["Gluten"]!)
    }
    
    func loadData(){
        fieldNome.text = defaults.string(
        forKey: "Nome")
        
        fieldAno.text = defaults.string(forKey: "Ano")
        
        switch defaults.string(forKey: "Sexo"){
        case "F":
            checkFem.isSelected = true
            break
        case "M":
            checkMasc.isSelected = true
            break
        default:
            print("Nenhuma")
        }
        
        
        for (key, value) in dicionario{
            switch key{
            case "Diabetes":
                bttDiab.isSelected = value
            case "Hipertensao":
                bttHipe.isSelected = value
            case "Lactose":
                bttLacto.isSelected = value
            case "Vegetariano":
                bttVege.isSelected = value
            case "Gastrite":
                bttGast.isSelected = value
            case "Gluten":
                bttGlut.isSelected = value
            default:
                print("default")
            }
        }
        
    }
    
    
    @IBAction func checkDiabetes(_ sender: UIButton) {
        if bttDiab.isSelected {
            bttDiab.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Diabetes")
        } else {
            bttDiab.isSelected = true
            print("on")
            dicionario.updateValue(true, forKey: "Diabetes")
        }
    }
    
    @IBAction func checkHiper(_ sender: UIButton) {
        if bttHipe.isSelected {
            bttHipe.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Hipertensao")
         } else {
             bttHipe.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Hipertensao")
             }
    }
    
    @IBAction func checkLacto(_ sender: Any) {
        if bttLacto.isSelected {
            bttLacto.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Lactose")
        } else {
             bttLacto.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Lactose")
             }
    }
    
    @IBAction func checkVeggie(_ sender: UIButton) {
        if bttVege.isSelected {
            bttVege.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Vegetariano")
         } else {
             bttVege.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Vegetariano")
             }
    }
    
    
    
    @IBAction func cbeckGast(_ sender: UIButton) {
        if bttGast.isSelected {
            bttGast.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Gastrite")
         } else {
             bttGast.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Gastrite")
             }
    }
    
    @IBAction func checkGlut(_ sender: UIButton) {
        if bttGlut.isSelected {
            bttGlut.isSelected = false
            print("off")
            dicionario.updateValue(false, forKey: "Gluten")
         } else {
             bttGlut.isSelected = true
             print("on")
             dicionario.updateValue(true, forKey: "Gluten")
             }
    }
    @IBAction func bttFem(_ sender: UIButton) {
        if(checkMasc.isSelected){
            checkMasc.isSelected = false
            checkFem.isSelected = true
            defaults.set("F", forKey: "Sexo")
        }
    }
    
    @IBAction func bttMasc(_ sender: UIButton) {
        if(checkFem.isSelected){
            checkFem.isSelected = false
            checkMasc.isSelected = true
            defaults.set("M", forKey: "Sexo")
        } 
    }
    
    @IBAction func bttSalvar(_ sender: UIButton) {
        defaults.set(dicionario, forKey: "Condicoes")
        defaults.set(fieldNome.text, forKey: "Nome")
        defaults.set(idade, forKey: "Idade")
        defaults.set(fieldAno.text, forKey: "Ano")
        print("Salvo")
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if verificaEdicao() != 2 {
            bttSalva.isHidden = true
        } else {
            bttSalva.isHidden = false
        }
        return false
    }
    
    func verificaEdicao() -> Int{
        let ano = Int(fieldAno.text!)
        var conta: Int = Int()
        var aux: Int = 0
        let data = Date()
        let calendario = Calendar.current
        
        bttSalva.isEnabled = !fieldNome.text!.trimmingCharacters(in: .whitespaces).isEmpty
        if fieldNome.text == "" || bttSalva.isEnabled == false{
            avisoNome.isHidden = false
            avisoNome.text = NSLocalizedString("avisoNomeVazio", comment: "Aviso caso nome seja inválido")
            //"Digite o seu nome"
        }  else if fieldNome.text!.count > 15{
            avisoNome.isHidden = false
            avisoNome.text = NSLocalizedString("avisoNomeGrande", comment: "Aviso caso nome seja grande")
            //"Digite um nome menor"
        }
        else {
            avisoNome.isHidden = true
            lblOla.text = NSLocalizedString("OlaNomeUser", comment: "Label para receber o usuário com o nome dele carregado") + " " +
                fieldNome.text!
            aux += 1
        }
        
        
        if ano == nil || fieldAno.text == ""{
            avisoAno.isHidden = false
            avisoAno.text = NSLocalizedString("anoEmBranco", comment: "Aviso para caso ano esteja em branco")
            //"Insira um ano"
               } else {
            conta = calendario.component(.year, from: data) - ano!
            if(conta < 0 || conta > 110){
                avisoAno.text = NSLocalizedString("anoInvalido", comment: "Aviso para caso ano seja inválido")
                //"Insira um ano válido"
            } else {
                avisoAno.isHidden = true
                idade = conta
                aux += 1
            }
        }
        return aux;
    }
    

    

    
}
