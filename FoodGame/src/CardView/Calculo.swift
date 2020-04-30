//
//  Calculo.swift
//  FoodGame
//
//  Created by Igor Kenzo Miyamoto Dias on 22/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
//MARK: Structs

//Valores máximos por prato (Exemplo: um prato de 300g tem X gramas de carboidrato, ...)
struct MaxValues
{
    let gCarbo : Float32
    let gProt : Float32
    let gVeg : Float32
}

//Separa os alimentos aceitos nos cards por tipo para realizar o calculo
struct AlimentosPorTipo
{
    let carbos : [Alimento]
    let legs : [Alimento]
    let prots : [Alimento]
    let protsV : [Alimento]
    let hort : [Alimento]
}

//MARK: Class

class Calculo {
    
    //MARK: Properties
    //Struct statica de valores maximos
    static var maxValue : MaxValues!
    
    //Struct statica de alimentos por tipo
    static var aliPorTipo : AlimentosPorTipo!
    //MARK: Functions
    //Define valores maximos (depois mudar para definir valores maximos baseado na idade)
    static func definirValoresMax()
    {
        //https://super.abril.com.br/saude/hora-do-almoco/
        
        //50% do prato Vegetais crus e cozidos
        //25% proteinas, tanto vegetal, quanto animal
        //25% carboidrato
        
        //300g no prato infantil
        //PlaceHolders
        Calculo.maxValue = MaxValues(gCarbo: 300/4, gProt: 300/4, gVeg: 300/2)
    }
    
    //Recebe lista de alimentos, separa por tipo e Retorna uma struct de Alimentos por tipo
    static func separarTipos(alimentos : [Alimento]) -> AlimentosPorTipo
    {
        var vcarbos = [Alimento]()
        var vlegs = [Alimento]()
        var vprots = [Alimento]()
        var vprotsV = [Alimento]()
        var vhort = [Alimento]()
        
        for a in alimentos {
            switch a.tipo {
            case "Carboidrato":
                vcarbos.append(a)
                break
            case "Leguminosa":
               vlegs.append(a)
                break
            case "Proteína" :
                vprots.append(a)
                break
            case "Proteína Vegetal":
                vprotsV.append(a)
                break
            case "Hortaliça":
                vhort.append(a)
                break
            default:
                break
            }
        }
        return AlimentosPorTipo(carbos: vcarbos, legs: vlegs, prots: vprots, protsV: vprotsV, hort: vhort)
    }
    
    //Calula(soma) a quantidade de gramas de carboidrato na struct AlimentoPorTipo
    static func calularCarbo() -> Int
    {
        var porcao = 0
        for carb in Calculo.aliPorTipo.carbos {
            porcao += carb.porcao
        }
        return porcao
    }
    
    //Calula(soma) a quantidade de gramas de proteina na struct AlimentoPorTipo
    static func calularProteina() -> Int
    {
        var porcao = 0
        for prot in Calculo.aliPorTipo.prots {
            porcao += prot.porcao
        }
        for protV in Calculo.aliPorTipo.protsV {
            porcao += protV.porcao
        }
        return porcao
    }
    
    //Calula(soma) a quantidade de gramas de vegetais na struct AlimentoPorTipo
    static func calcularVegetais() -> Int
    {
        var porcao = 0
        for hort in Calculo.aliPorTipo.hort {
            porcao += hort.porcao
        }
        for protV in Calculo.aliPorTipo.legs {
            porcao += protV.porcao
        }
        return porcao
    }
}
