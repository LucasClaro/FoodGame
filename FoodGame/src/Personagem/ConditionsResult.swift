//
//  ConditionsResult.swift
//  FoodGame
//
//  Created by Felipe Ferreira on 15/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit

class prato: UIViewController{
    var vetor: [String] = []
    
    @IBOutlet weak var varNao: UIButton!
    @IBOutlet weak var varSim: UIButton!
    var confirma: Bool!
    var achou: Bool = false
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let condicoes = defaults.object(forKey: "Condicoes") as? [String]
        if(condicoes!.count > 1){
        for i in 0...condicoes!.count - 1{
            print(condicoes![i])
        }
        }
    }
    
    @IBAction func botaoSim(_ sender: UIButton) {
        for i in 0..<vetor.count{
            if vetor[i] == "3"{
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

