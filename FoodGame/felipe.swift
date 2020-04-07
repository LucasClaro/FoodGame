//
//  inicio.swift
//  User
//
//  Created by Felipe Ferreira on 30/03/20.
//  Copyright © 2020 Felipe Ferreira. All rights reserved.
//

import Foundation
import UIKit

class inicioClass: UIViewController {
    
    var nome: String! = nil
    @IBOutlet var telinha: UIView!
    @IBOutlet var botao: UIButton!
    @IBOutlet var varBotaoJoga: UIButton!
    
    
    
    // MARK:- !*!*!*!*!*!*!*!*!*!*! BEGGINING OF ALERT CONTROLLER FOR NAME !*!*!*!*!*!*!*!*!*!*!
    @IBAction func colocaNome(_ sender: UIButton) {
        
            // Setting up alert controller
            let alertController = UIAlertController(title: "Nome", message: nil, preferredStyle: .alert)
            
            
            // Set up the actions
            let addAdction = UIAlertAction(title: "Adicionar", style: .default){ _ in
            
            // Grab text field text
            guard let name = alertController.textFields?.first?.text else {return}
            
            // Create name
            self.nome = name
            self.botao.setTitle(name, for: .normal)
            self.botao.isEnabled = false
                self.varBotaoJoga.isHidden = false
                
            // Add name <!-- not used in here, it is used on table view, which is not our case --!>
            
            
            // Reload name in table view <!-- not used in here --!>
        }
        
            addAdction.isEnabled = false;
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
            
            
            // Add the text field
            alertController.addTextField{ textField in
                
                textField.placeholder = "Digite o nome..."
                textField.addTarget(self, action: #selector(self.handleTextChanged), for: .editingChanged)
                }
        
            // Add the actions
            alertController.addAction(addAdction) // first added here here !*!
            alertController.addAction(cancelAction)
            
            // Present
            present(alertController, animated: true)
        }
    
    @objc private func handleTextChanged(_ sender:UITextField){
        
        // Grab the alert controller and add action
        guard let alertController = presentedViewController as? UIAlertController,
            let addAction = alertController.actions.first, // first as in first added !*!
            let text = sender.text
            else {
                return
            }
        
        // Enable add action if text is empty or contain white spaces
        addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
        
    }
    // MARK:-!*!*!*!*!*!*!*!*!*!*!*! ENDING OF ALERT CONTROLLER FOR NAME !*!*!*!*!*!*!*!*!*!*!*!
        
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK:- Sends info from view 1 to view 2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "identificador"{
            if let secondVC = segue.destination as? segunda{
                secondVC.objetoInfo = nome
            }
        }
    }
    
}
    
class segunda: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var bttTela3: UIButton!
    @IBOutlet weak var idadeatual: UILabel!
    @IBOutlet var caixaTexto: UITextField!
    @IBOutlet var label: UILabel!
    var objetoInfo:String?

    // MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        
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
    
    // MARK:- "Ok" button for age
       @IBAction func botaoIdade(_ sender: Any) {
        let idade = Int(caixaTexto.text!)
        
            
        if caixaTexto.text == nil || caixaTexto.text == ""{
            idadeatual.text = "Insira um valor"
               } else {
                let conta = 2020 - idade!
            idadeatual.text = "Legal! Então sua idade esse ano é \(conta)"
            self.bttTela3.isHidden = false
            }
        
        idadeatual.isHidden = false
           
       }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}


class terceira: UIViewController{
    @IBOutlet var temDiabetes: UISwitch!
    @IBOutlet var temHipertensao: UISwitch!
    @IBOutlet var temIntolerancia: UISwitch!
    @IBOutlet var isVegetariano: UISwitch!
    var vetor: [Int] = []
    var i = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temDiabetes.isOn = false
        temHipertensao.isOn = false
        temIntolerancia.isOn = false
        isVegetariano.isOn = false
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(vetor, forKey: "vetor")
        
    }
    
    @IBAction func switchDiab(_ sender: UISwitch) {
        if temDiabetes.isOn{
            temDiabetes.tag = 1;
            vetor.append(1)
            i += 1
            
            
        }
    }
    @IBAction func switchHiper(_ sender: UISwitch) {
        if temHipertensao.isOn{
            temHipertensao.tag = 2;
            vetor.append(2)
            i+=1
                }
    }
        
    
    @IBAction func switchInto(_ sender: UISwitch) {
        if temIntolerancia.isOn{
            temIntolerancia.tag = 3;
            vetor.append(3)
            i+=1
        } 
    }
    @IBAction func switchVeggie(_ sender: UISwitch) {
        if isVegetariano.isOn{
            isVegetariano.tag = 4;
            vetor.append(4)
            i+=1
        }
    }
    
    @IBAction func imprime(_ sender: UIButton) {
        for i in 0..<vetor.count{
            print("vetor", vetor[i])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vetor"{
            if let prato = segue.destination as? prato{
                prato.vetor = vetor
            }
        }
    }
}

class dados{

    init(){
    // Access Shared Defaults Object
    let userDefaults = UserDefaults.standard

    // Create and Write Array of Strings
        let vetor:[Int] = []
    
        userDefaults.set(vetor, forKey: "myKey")

    // Read/Get Array of Strings
    //let strings = userDefaults.object(forKey: "myKey") as? [String]
    
    }
}

class prato: UIViewController{
    var vetor: [Int] = []
    
    @IBOutlet weak var varNao: UIButton!
    @IBOutlet weak var varSim: UIButton!
    var confirma: Bool!
    var achou: Bool = false
    
    @IBAction func botaoSim(_ sender: UIButton) {
        for i in 0..<vetor.count{
            if vetor[i] == 3{
                confirma = true;
                achou = true;
            }
        }
        if !achou{
        confirma = false;
        }
        
    }
    
    @IBAction func botaoNao(_ sender: UIButton) {
        confirma = false;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sim"{
            if let result = segue.destination as? telaResult{
                result.prato = confirma
                
                
            }
        }
        if segue.identifier == "nao"{
            if let result = segue.destination as? telaResult{
                result.prato = confirma
            }
        }
    }
    
}

class telaResult: UIViewController{
    
    @IBOutlet weak var resultado: UILabel!
    var prato: Bool!
    
    override func viewDidLoad() {
        if resultado != nil{
        super.viewDidLoad()
            if prato == true{
            resultado.text = "Não pode!"
        }
            else if prato == false{
            resultado.text = "Pode!"
        } else {
            resultado.text = "?"
        }
    }
}
}
