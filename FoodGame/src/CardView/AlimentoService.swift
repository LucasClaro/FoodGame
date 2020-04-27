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
    
    let carbs: [Alimento] = [
        Alimento(id: 101, nome: "Arroz", porcao: 100, tipo: "Carboidrato", foto: "Arroz"),
        Alimento(id: 102, nome: "Pão", porcao: 100, tipo: "Carboidrato", foto: "Pao"),
        Alimento(id: 103, nome: "Batata", porcao: 100, tipo: "Carboidrato", foto: "Batata"),
        Alimento(id: 104, nome: "Macarrão", porcao: 100, tipo: "Carboidrato", foto: "Pao"),
        Alimento(id: 105, nome: "Derivados do Trigo", porcao: 100, tipo: "Carboidrato", foto: "Pao"),
    ]
    
    let legs: [Alimento] = [
        Alimento(id: 201, nome: "Feijão", porcao: 100, tipo: "Leguminosa", foto: "Feijao"),
        Alimento(id: 202, nome: "Soja", porcao: 100, tipo: "Leguminosa", foto: "Soja"),
        Alimento(id: 203, nome: "Ervilha", porcao: 100, tipo: "Leguminosa", foto: "Ervilha"),
        Alimento(id: 204, nome: "Lentilha", porcao: 100, tipo: "Leguminosa", foto: "Lentilha"),
        Alimento(id: 205, nome: "Grão-de-Bico", porcao: 100, tipo: "Leguminosa", foto: "Grao de bico"),
    ]
    
    let prots: [Alimento] = [
        Alimento(id: 301, nome: "Carne Bovina", porcao: 100, tipo: "Proteína", foto: "Carne Bovina"),
        Alimento(id: 302, nome: "Frango", porcao: 100, tipo: "Proteína", foto: "Frango"),
        Alimento(id: 303, nome: "Peixe", porcao: 100, tipo: "Proteína", foto: "Peixe"),
        Alimento(id: 304, nome: "Ovos", porcao: 100, tipo: "Proteína", foto: "Ovos"),
        Alimento(id: 305, nome: "Carne Suína", porcao: 100, tipo: "Proteína", foto: "Carne Suina"),
        Alimento(id: 306, nome: "Fígado", porcao: 100, tipo: "Proteína", foto: "Pao"),
        Alimento(id: 307, nome: "Manteiga", porcao: 100, tipo: "Proteína", foto: "Pao"),
        Alimento(id: 308, nome: "Queijo", porcao: 100, tipo: "Proteína", foto: "Queijo"),
    ]
    
    let protsV: [Alimento] = [
        Alimento(id: 401, nome: "Lentilha", porcao: 100, tipo: "Proteína Vegetal", foto: "Lentilha"),
        Alimento(id: 402, nome: "Tofu", porcao: 100, tipo: "Proteína Vegetal", foto: "Tofu"),
        Alimento(id: 403, nome: "Chia", porcao: 100, tipo: "Proteína Vegetal", foto: "Chia"),
     ]
    
    let hort: [Alimento] = [
        Alimento(id: 501, nome: "Alface", porcao: 100, tipo: "Hortaliça", foto: "Alface"),
        Alimento(id: 502, nome: "Espinafre", porcao: 100, tipo: "Hortaliça", foto: "Espinafre"),
        Alimento(id: 503, nome: "Brócolis", porcao: 100, tipo: "Hortaliça", foto: "Pao"),
        Alimento(id: 504, nome: "Cenoura", porcao: 100, tipo: "Hortaliça", foto: "Cenoura"),
        Alimento(id: 505, nome: "Chuchu", porcao: 100, tipo: "Hortaliça", foto: "Pao"),
        Alimento(id: 506, nome: "Abóbora", porcao: 100, tipo: "Hortaliça", foto: "Pao"),
        Alimento(id: 507, nome: "Vagem", porcao: 100, tipo: "Hortaliça", foto: "Pao"),
        Alimento(id: 508, nome: "Berinjela", porcao: 100, tipo: "Hortaliça", foto: "Berinjela"),
        Alimento(id: 509, nome: "Beterraba", porcao: 100, tipo: "Hortaliça", foto: "Beterraba"),
        Alimento(id: 510, nome: "Couve", porcao: 100, tipo: "Hortaliça", foto: "Couve"),
    ]
    
    func buscaCarboidratos () -> [Alimento] {
        return self.carbs
    }
    
    func buscaLeguminosas () -> [Alimento] {
        return self.legs
    }
    
    func buscaProteinas () -> [Alimento] {
        return self.prots
    }
    
    func buscaProteinasVegetais () -> [Alimento] {
        return self.protsV
    }
    
    func buscaHortlicas () -> [Alimento] {
        return self.hort
    }
    
}
