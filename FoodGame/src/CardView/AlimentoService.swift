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
    ///["Diabetes", "Hipertensao", "Lactose", "Vegetariano", "Gastrite", "Gluten"]  -> restricoes
    let carbs: [Alimento] = [
        Alimento(id: 101, nome: "Arroz", porcao: 75, tipo: "Carboidrato", foto: "Arroz", restricoes: [""]),
        Alimento(id: 102, nome: "Pão", porcao: 75, tipo: "Carboidrato", foto: "Pao", restricoes: ["Diabetes","Gluten"]),
        Alimento(id: 103, nome: "Pão Integral", porcao: 12, tipo: "Carboidrato", foto: "pao integral", restricoes: ["Gluten"]),
        Alimento(id: 104, nome: "Batata", porcao: 75, tipo: "Carboidrato", foto: "Batata", restricoes: [""]),
        Alimento(id: 105, nome: "Macarrão", porcao: 75, tipo: "Carboidrato", foto: "Macarrao", restricoes: ["Diabetes","Gluten"]),
        Alimento(id: 106, nome: "Bolo", porcao: 75, tipo: "Carboidrato", foto: "Pao", restricoes: ["Diabetes","Gluten"]),
        Alimento(id: 107, nome: "Biscoito", porcao: 12, tipo: "Carboidrato", foto: "Pao", restricoes: ["Diabetes","Gluten"]),
        //Alimento(id: 105, nome: "Derivados do Trigo", porcao: 75, tipo: "Carboidrato", foto: "Pao", restricoes: [""]),
    ]
    
    let legs: [Alimento] = [
        Alimento(id: 201, nome: "Feijão", porcao: 150, tipo: "Leguminosa", foto: "Feijao", restricoes: [""]),
        Alimento(id: 202, nome: "Soja", porcao: 150, tipo: "Leguminosa", foto: "Soja", restricoes: [""]),
        Alimento(id: 203, nome: "Ervilha", porcao: 150, tipo: "Leguminosa", foto: "Ervilha", restricoes: [""]),
        Alimento(id: 204, nome: "Lentilha", porcao: 150, tipo: "Leguminosa", foto: "Lentilha", restricoes: [""]),
        Alimento(id: 205, nome: "Grão-de-Bico", porcao: 150, tipo: "Leguminosa", foto: "Grao de bico", restricoes: [""]),
    ]
    
    let prots: [Alimento] = [
        Alimento(id: 301, nome: "Lombo", porcao: 75, tipo: "Proteína", foto: "lombo", restricoes: [""]),
        Alimento(id: 302, nome: "Coxa de frango", porcao: 75, tipo: "Proteína", foto: "coxa de frango", restricoes: [""]),
        Alimento(id: 303, nome: "Peixe", porcao: 75, tipo: "Proteína", foto: "Peixe", restricoes: [""]),
        Alimento(id: 304, nome: "Ovo cozido", porcao: 75, tipo: "Proteína", foto: "Ovo cozido", restricoes: [""]),
        Alimento(id: 305, nome: "Ovo frito", porcao: 75, tipo: "Proteína", foto: "Ovo frito", restricoes: ["Diabetes","Hipertensao"]),
        Alimento(id: 306, nome: "Bife", porcao: 75, tipo: "Proteína", foto: "bife", restricoes: [""]),
        Alimento(id: 307, nome: "Bacon", porcao: 75, tipo: "Proteína", foto: "bacon", restricoes: ["Diabetes","Hipertensao","Gastrite"]),
        Alimento(id: 308, nome: "File de frango", porcao: 75, tipo: "Proteína", foto: "file de frango", restricoes: [""]),
        Alimento(id: 309, nome: "Queijo", porcao: 75, tipo: "Proteína", foto: "Queijo", restricoes: ["Lactose","Gastrite","Gluten"]),
    ]
    
    let protsV: [Alimento] = [
        Alimento(id: 401, nome: "Lentilha", porcao: 35, tipo: "Proteína Vegetal", foto: "Lentilha", restricoes: [""]),
        Alimento(id: 402, nome: "Tofu", porcao: 10, tipo: "Proteína Vegetal", foto: "Tofu", restricoes: [""]),
        Alimento(id: 403, nome: "Chia", porcao: 5, tipo: "Proteína Vegetal", foto: "Chia", restricoes: [""]),
     ]
    
    let hort: [Alimento] = [
        Alimento(id: 501, nome: "Alface", porcao: 7, tipo: "Hortaliça", foto: "Alface", restricoes: [""]),
        Alimento(id: 502, nome: "Espinafre", porcao: 10, tipo: "Hortaliça", foto: "Espinafre", restricoes: [""]),
        Alimento(id: 503, nome: "Brócolis", porcao: 25, tipo: "Hortaliça", foto: "Brocolis", restricoes: [""]),
        Alimento(id: 504, nome: "Cenoura", porcao: 15, tipo: "Hortaliça", foto: "Cenoura", restricoes: [""]),
        Alimento(id: 505, nome: "Chuchu", porcao: 5, tipo: "Hortaliça", foto: "Pao", restricoes: [""]),
        Alimento(id: 506, nome: "Abóbora", porcao: 15, tipo: "Hortaliça", foto: "Pao", restricoes: [""]),
        Alimento(id: 507, nome: "Vagem", porcao: 10, tipo: "Hortaliça", foto: "Pao", restricoes: [""]),
        Alimento(id: 508, nome: "Berinjela", porcao: 26, tipo: "Hortaliça", foto: "Berinjela", restricoes: [""]),
        Alimento(id: 509, nome: "Beterraba", porcao: 17, tipo: "Hortaliça", foto: "Beterraba", restricoes: [""]),
        Alimento(id: 510, nome: "Couve", porcao:9, tipo: "Hortaliça", foto: "Couve", restricoes: [""]),
        Alimento(id: 511, nome: "Pepino", porcao:9, tipo: "Hortaliça", foto: "pepino", restricoes: [""]),
        Alimento(id: 512, nome: "Tomate", porcao:9, tipo: "Hortaliça", foto: "tomate", restricoes: [""]),
    ]
    
    let frutas : [Alimento] = [
        Alimento(id: 601, nome: "Banana", porcao:1, tipo: "Fruta", foto: "Banana", restricoes: [""]),
        Alimento(id: 602, nome: "Laranja", porcao:1, tipo: "Fruta", foto: "Laranja", restricoes: [""]),
        Alimento(id: 603, nome: "Maçã", porcao:1, tipo: "Fruta", foto: "Maca", restricoes: [""]),
        Alimento(id: 604, nome: "Melancia", porcao:1, tipo: "Fruta", foto: "Melancia", restricoes: [""]),
    ]
    
    let bebs : [Alimento] = [
        Alimento(id: 701, nome: "Cafe", porcao:150, tipo: "Bebida", foto: "Cafe", restricoes: ["Gastrite"]),
        Alimento(id: 702, nome: "Refrigerante", porcao:150, tipo: "Bebida", foto: "Refrigerante", restricoes: ["Diabetes","Gastrite"]),
        Alimento(id: 703, nome: "Suco de laranja", porcao:150, tipo: "Bebida", foto: "Suco de laranja", restricoes: [""]),
        Alimento(id: 704, nome: "Suco de melancia", porcao:150, tipo: "Bebida", foto: "Suco de melancia", restricoes: [""]),
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
    
    func buscaFrutas () -> [Alimento] {
        return self.frutas
    }
    
    func buscaBebidas () -> [Alimento] {
        return self.bebs
    }
    
}
