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
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verificaNome.isHidden = true
        nomeField.delegate = self
        sobrenomeField.delegate = self
        varBotaoJoga.backgroundColor = .systemBlue
        varBotaoJoga.setTitleColor(.white, for: .normal)
        varBotaoJoga.layer.cornerRadius = 30
        
    }
    // MARK:- Sends info from view 1 to view 2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "identificador"{
            if let secondVC = segue.destination as? age{
                secondVC.objetoInfo = nomeField.text
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           verifica()
           return false
       }
    
    func verifica(){
        varBotaoJoga.isEnabled = !nomeField.text!.trimmingCharacters(in: .whitespaces).isEmpty
        if nomeField.text == "" || varBotaoJoga.isEnabled == false{
            verificaNome.isHidden = false
            verificaNome.text = "Digite o seu nome"
        } else {
            verificaNome.isHidden = true
            varBotaoJoga.isEnabled = true
        }
    }
    
}
    
class age: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var bttTela3: UIButton!
    @IBOutlet weak var idadeatual: UILabel!
    @IBOutlet var caixaTexto: UITextField!
    @IBOutlet var label: UILabel!
    var objetoInfo:String?

    // MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        caixaTexto.delegate = self
        
        idadeatual.isHidden = true
        
        label.numberOfLines = 10
        
        if objetoInfo != nil{
            label.text = "Olá " + objetoInfo! + ", " + "\nSeja bem-vindo(a)"
        }
        
    }
    
    // MARK: - Allowing text field to only get numbers
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "0123456789"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    func valida(){
        let idade = Int(caixaTexto.text!)
        
            
        if caixaTexto.text == nil || caixaTexto.text == ""{
            idadeatual.text = "Insira um ano"
               } else {
                let conta = 2020 - idade!
            if(conta < 0 || conta > 110){
                idadeatual.text = "Insira um ano válido"
            } else {
                idadeatual.text = ""
                self.bttTela3.isHidden = false
            }
            
            }
        
        idadeatual.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        valida()
        return false
    }
    
}

