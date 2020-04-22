//
//  Calculo.swift
//  FoodGame
//
//  Created by Igor Kenzo Miyamoto Dias on 22/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

struct MaxValues
{
    let gCarbo : Float32
    let glegs : Float32
    let prots : Float32
    let protsV : Float32
    let hort : Float32
}

struct AlimentosPorTipo
{
    let carbos : [Alimento]
    let legs : [Alimento]
    let prots : [Alimento]
    let protsV : [Alimento]
    let hort : [Alimento]
}
/*
enum TipoAlimento : String {
    case carbo = "Carboidrato"
    case legs = "Leguminosa"
    case prots = "Proteína"
    case protsV = "Proteína Vegetal"
    case hort = "Hortaliça"
}*/

class Calculo {
    
    static var maxValue : MaxValues!
    
    static var aliPorTipo : AlimentosPorTipo!
    
    static func definirValoresMax()
    {
        //https://super.abril.com.br/saude/hora-do-almoco/
    }
    
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
    
    static func calularCarbo()
    {
        
    }
}
