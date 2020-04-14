//
//  AlimentoService.swift
//  testStoryboard
//
//  Created by Glauber Moreira on 09/04/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//

import Foundation

class AlimentoService {
    
    static let shared = AlimentoService()
    
    let alimentos: [Alimento] = [
        
        
        Alimento(id: 101, nome: "Arroz", porcao: 100, tipo: "Carboidrato", foto: "Arroz"),
        Alimento(id: 102, nome: "Bife", porcao: 100, tipo: "Proteína", foto: "Bife"),
        Alimento(id: 103, nome: "Pão", porcao: 100, tipo: "Carboidrato", foto: "Pao"),
        Alimento(id: 104, nome: "Frango", porcao: 150, tipo: "Proteína", foto: "Frango"),
        Alimento(id: 105, nome: "Maça", porcao: 100, tipo: "Fruta", foto: "maca")
        
    ]
    
    func buscaAlimentos () -> [Alimento] {
        
        return self.alimentos
        
    }
    
}
