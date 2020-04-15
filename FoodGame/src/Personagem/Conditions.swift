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
    
    
    var vetor: [String] = []
    var i = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        userDefaults.set(vetor, forKey: "vetor")
        
    }
    
    @IBAction func checkDiabetes(_ sender: Any) {
        if temDiab.isSelected {
            temDiab.isSelected = false
            print("off")
            if let index = vetor.firstIndex(of: "1"){
            vetor.remove(at: index)
            print("Removido")
            }
        } else {
            temDiab.isSelected = true
            print("on")
            vetor.append("1")
            i += 1
        }
    }
    @IBAction func checkHiper(_ sender: UIButton) {
        if temHipe.isSelected {
           temHipe.isSelected = false
            print("off")
            if let index = vetor.firstIndex(of: "2"){
            vetor.remove(at: index)
            print("Removido")
                    }
            } else {
                temHipe.isSelected = true
                print("on")
                vetor.append("2")
                i+=1
                }
    }
    
    @IBAction func checkIntolerante(_ sender: UIButton) {
        if temInto.isSelected {
        temInto.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "3"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             temInto.isSelected = true
             print("on")
             vetor.append("3")
             i+=1
             }
    }
    
    @IBAction func checkVeggie(_ sender: UIButton) {
        if isVege.isSelected {
        isVege.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "4"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             isVege.isSelected = true
             print("on")
             vetor.append("4")
             i+=1
             }
    }
    
    @IBAction func checkGastrite(_ sender: UIButton) {
        if temGast.isSelected {
        temGast.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "5"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             temGast.isSelected = true
             print("on")
             vetor.append("5")
             i+=1
             }
    }
    
    @IBAction func checkGluten(_ sender: UIButton) {
        if isGlut.isSelected {
        isGlut.isSelected = false
         print("off")
         if let index = vetor.firstIndex(of: "6"){
         vetor.remove(at: index)
         print("Removido")
                 }
         } else {
             isGlut.isSelected = true
             print("on")
             vetor.append("6")
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
