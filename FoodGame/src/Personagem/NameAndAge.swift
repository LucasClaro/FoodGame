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
    
    @IBOutlet var bttTela3: UIButton!
    @IBOutlet weak var idadeatual: UILabel!
    @IBOutlet var caixaTexto: UITextField!
    @IBOutlet var label: UILabel!
    let defaults = UserDefaults.standard
    var idade: Int = Int()
    var anoN: String = String()
    let datePicker = UIDatePicker()
    let calendar = Calendar(identifier: .gregorian)
    let currentDate = Date()
    var components = DateComponents()

    
    // MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //caixaTexto.delegate = self
        //idadeatual.isHidden = true
        label.numberOfLines = 10
        createDatePicker(caixaTexto: caixaTexto)
        print(defaults.integer(forKey: "Idade"))
        visualBotao(sender: bttTela3)
    }
  
    //MARK: - Define calendar
    func defineCalendar(datePicker: UIDatePicker){
        components.calendar = calendar
        components.year = -1
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        components.year = -50
        let minDate = calendar.date(byAdding: components, to: currentDate)!

        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
    }
    //MARK: - Date picker
    func createDatePicker(caixaTexto: UITextField){
        defineCalendar(datePicker: datePicker)
        caixaTexto.textAlignment = .center
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtt = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtt], animated: true)
        
        //assign toolbar
        caixaTexto.inputAccessoryView = toolbar
        
        //assign date picker to text field
        caixaTexto.inputView = datePicker
        
        //create date picker mode
        datePicker.datePickerMode = .date
    }
    
    // MARK: - Done pressed
    @objc func donePressed(){
        //formater
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MM/yyy"
        
        caixaTexto.text = formatter.string(from: datePicker.date)
        bttTela3.isHidden = false
        self.view.endEditing(true)
        
        //Realiza conta
        let calendario = Calendar.current
        let ano:Int
        let idade: Int
        ano = calendar.dateComponents([.year], from: datePicker.date).year!  
        idade = calendario.component(.year, from: currentDate) - ano
        defaults.set(idade, forKey: "Idade")
        defaults.set(ano, forKey: "Ano")
        
    }

    
    func getIdade() -> Int{
        return idade
    }
    
    func getAno() -> String{
        return anoN
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
