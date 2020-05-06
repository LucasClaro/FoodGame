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
    var defaults = UserDefaults.standard
    var nome: String = String()
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        verificaNome.isHidden = true
        nomeField.delegate = self
        visualBotao(sender: varBotaoJoga)
        
    }
  
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           verifica(nomeField: nomeField, verificaNome: verificaNome, botao: varBotaoJoga)
           return false
       }
    
    func verifica(nomeField: UITextField, verificaNome: UILabel, botao: UIButton){
        botao.isEnabled = !nomeField.text!.trimmingCharacters(in: .whitespaces).isEmpty
        if nomeField.text == "" || botao.isEnabled == false{
            verificaNome.isHidden = false
            verificaNome.text = NSLocalizedString("avisoNomeVazio", comment: "Aviso caso nome seja inválido")
            //"Digite o seu nome"
            botao.isHidden = true
            } else if nomeField.text!.count > 15{
                verificaNome.isHidden = false
                verificaNome.text = NSLocalizedString("avisoNomeGrande", comment: "Aviso caso nome seja grande")
                //"Digite um nome menor"
                botao.isHidden = true
            } else {
                defaults.set(nomeField.text, forKey: "Nome")
                verificaNome.isHidden = true
                botao.isHidden = false
            }
    }
    
    func setNome(nome: String){
        self.nome = nome
    }

    func getNome() -> String{
        return self.nome
    }
    
}
    
class age: UIViewController, UITextFieldDelegate{
    
    var datePicker: UIDatePicker?
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
    func valida (caixaTexto: UITextField, avisoIdade: UILabel, botao: UIButton){
        let ano = Int(caixaTexto.text!)
        let anoNasc = caixaTexto.text
        var conta: Int = 1
        let data = Date()
        let calendario = Calendar.current
        
        
        if caixaTexto.text == nil || caixaTexto.text == ""{
            avisoIdade.text = NSLocalizedString("anoEmBranco", comment: "Aviso para caso ano esteja em branco")
            //"Insira um ano"
            botao.isHidden = true
               } else {
            conta = calendario.component(.year, from: data) - ano!
            botao.isHidden = true
            if(conta < 0 || conta > 110){
                avisoIdade.text = NSLocalizedString("anoInvalido", comment: "Aviso para caso ano seja inválido")
                //"Insira um ano válido"
                botao.isHidden = true
            } else {
                avisoIdade.text = ""
                botao.isHidden = false
                idade = conta
                anoN = anoNasc!
                defaults.set(idade, forKey: "Idade")
                defaults.set(anoN, forKey: "Ano")
            }
        }
        
        avisoIdade.isHidden = false
    }
    
    func getIdade() -> Int{
        return idade
    }
    
    func getAno() -> String{
        return anoN
    }
    
    
      // MARK: - Keyboard goes off when return is clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        valida(caixaTexto: caixaTexto, avisoIdade: idadeatual, botao: bttTela3)
        return false
    }
    
    
    
}

class sex: UIViewController {
    @IBOutlet weak var checkFem: UIButton!
    @IBOutlet weak var checkMasc: UIButton!
    @IBOutlet weak var bttProx: UIButton!
    @IBOutlet weak var imgViewPerso: UIImageView!
  
  
  
    let defaults = UserDefaults.standard
    var sexo: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualBotao(sender: bttProx)
    }
  
    func getSexo() -> String{
        return sexo
    }
    
    @IBAction func bttFem(_ sender: UIButton) {
        if(checkMasc.isSelected){
            checkMasc.isSelected = false
            checkFem.isSelected = true
            defaults.set("F", forKey: "Sexo")
            self.sexo = "F"
            bttProx.isHidden = false
        } else {
            checkFem.isSelected = true
            defaults.set("F", forKey: "Sexo")
            self.sexo = "F"
            bttProx.isHidden = false
        }
      imgViewPerso.image = UIImage(named: "Menina")
    }
    
    @IBAction func bttMasc(_ sender: UIButton) {
        if(checkFem.isSelected){
            checkFem.isSelected = false
            checkMasc.isSelected = true
            defaults.set("M", forKey: "Sexo")
            self.sexo = "M"
            bttProx.isHidden = false
        } else {
            checkMasc.isSelected = true
            defaults.set("M", forKey: "Sexo")
            self.sexo = "M"
            bttProx.isHidden = false
        }
      imgViewPerso.image = UIImage(named: "Menino")
    }
    
}

func visualBotao(sender: UIButton){
    sender.backgroundColor = .systemBlue
    sender.setTitleColor(.white, for: .normal)
    sender.layer.cornerRadius = 30
}
