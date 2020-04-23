//
//  NameAndAge.swift
//  FoodGame
//
//  Created by Felipe Ferreira on 15/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit


class name: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var verificaNome: UILabel!
    @IBOutlet var varBotaoJoga: UIButton!
    @IBOutlet weak var nomeField: UITextField!
    @IBOutlet weak var sobrenomeField: UITextField!
    var defaults = UserDefaults.standard
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        verificaNome.isHidden = true
        nomeField.delegate = self
        sobrenomeField.delegate = self
        visualBotao(sender: varBotaoJoga)

    }

    @IBAction func bttProx(_ sender: UIButton) {
        defaults.set(nomeField.text, forKey: "Nome")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           verifica(nomeField: nomeField, verificaNome: verificaNome, botao: varBotaoJoga)
           return false
       }
    
    func verifica(nomeField: UITextField, verificaNome: UILabel, botao: UIButton) -> Bool{
        var verifica: Bool = false
        botao.isEnabled = !nomeField.text!.trimmingCharacters(in: .whitespaces).isEmpty
        if nomeField.text == "" || botao.isEnabled == false{
            verificaNome.isHidden = false
            verificaNome.text = "Digite o seu nome"
            botao.isHidden = true
        } else {
            verificaNome.isHidden = true
            botao.isHidden = false
            verifica = true
        }
        return verifica
    }
    
}
    
class age: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var bttTela3: UIButton!
    @IBOutlet weak var idadeatual: UILabel!
    @IBOutlet var caixaTexto: UITextField!
    @IBOutlet var label: UILabel!
    let defaults = UserDefaults.standard
    var idade: Int = Int()
    var anoN: String = String()
    
    // MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        caixaTexto.delegate = self
        idadeatual.isHidden = true
        label.numberOfLines = 10
        print(defaults.integer(forKey: "Idade"))
        visualBotao(sender: bttTela3)
        
    }
    
    // MARK: - Allowing text field to only get numbers
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "0123456789"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    // MARK: - Validate user entry
    func valida (caixaTexto: UITextField, avisoIdade: UILabel, botao: UIButton) -> Int{
        let ano = Int(caixaTexto.text!)
        let anoNasc = caixaTexto.text
        var conta: Int = 1
            
        if caixaTexto.text == nil || caixaTexto.text == ""{
            avisoIdade.text = "Insira um ano"
            botao.isHidden = true
               } else {
                conta = 2020 - ano!
            botao.isHidden = true
            if(conta < 0 || conta > 110){
                avisoIdade.text = "Insira um ano válido"
                botao.isHidden = true
            } else {
                avisoIdade.text = ""
                botao.isHidden = false
                idade = conta
                anoN = anoNasc!
            }
            
            }
        
        avisoIdade.isHidden = false
        return conta
    }
    
      // MARK: - Keyboard goes off when return is clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        idade = valida(caixaTexto: caixaTexto, avisoIdade: idadeatual, botao: bttTela3)
        return false
    }
    
    @IBAction func proxBtt(_ sender: UIButton) {
        defaults.set(idade, forKey: "Idade")
        defaults.set(anoN, forKey: "Ano")
        
    }
    
    
}

class sexo: UIViewController {
    @IBOutlet weak var checkFem: UIButton!
    @IBOutlet weak var checkMasc: UIButton!
    @IBOutlet weak var bttProx: UIButton!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualBotao(sender: bttProx)
    }
    
    @IBAction func bttFem(_ sender: UIButton) {
        if(checkMasc.isSelected){
            checkMasc.isSelected = false
            checkFem.isSelected = true
            defaults.set("F", forKey: "Sexo")
            bttProx.isHidden = false
        } else {
            checkFem.isSelected = true
            defaults.set("F", forKey: "Sexo")
            bttProx.isHidden = false
        }
    }
    
    @IBAction func bttMasc(_ sender: UIButton) {
        if(checkFem.isSelected){
            checkFem.isSelected = false
            checkMasc.isSelected = true
            defaults.set("M", forKey: "Sexo")
            bttProx.isHidden = false
        } else {
            checkMasc.isSelected = true
            defaults.set("M", forKey: "Sexo")
            bttProx.isHidden = false
        }
    }
    
}

func visualBotao(sender: UIButton){
    sender.backgroundColor = .systemBlue
    sender.setTitleColor(.white, for: .normal)
    sender.layer.cornerRadius = 30
}
