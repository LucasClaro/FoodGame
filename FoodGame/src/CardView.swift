//
//  CardView.swift
//  FoodGame
//
//  Created by Glauber Moreira on 14/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import UIKit

enum Acao {
    
    case aceita
    case rejeita
    
}


class CardViewController: UIViewController {
    
    var alimentos : [Alimento] = []
    
    @IBOutlet weak var card: UIView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

          //  card.CombineCardView()
            
            self.buscaAlimentos()
            
        }
        func buscaAlimentos(){
            
            self.alimentos = AlimentoService.shared.buscaAlimentos()
            self.adicionarCards()
            
            
        }


    }

    extension CardViewController {
        func adicionarCards(){
            
            for alimento in alimentos {
                
                let cards = CombineCardView()
                
                cards.backgroundColor = .red
               cards.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
                   cards.center = view.center
                
                   cards.alimento = alimento
                   cards.tag = alimento.id
                
                   let gesture = UIPanGestureRecognizer()
                   gesture.addTarget(self, action: #selector(handlerCard))
                   cards.addGestureRecognizer(gesture)
                   
                
                    card = cards
                   view.insertSubview(card, at: 1)
            }
        }
    }

    extension CardViewController {
        
        func removerCard (card: UIView){
            
            card.removeFromSuperview()
            
            self.alimentos = self.alimentos.filter({ (alimento) -> Bool in
                return alimento.id != card.tag
            })
            
        }
        
    }

    extension CardViewController {
        
        @objc func handlerCard (_ gesture: UIPanGestureRecognizer){
            if let card = gesture.view as? CombineCardView {
                let point = gesture.translation(in: view)
                
                card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
                   
                let rotateAngle = point.x / view.bounds.width * 0.4
                
                if point.x > 0 {
                    
                    card.aceitaImageView.alpha = rotateAngle * 5
                    card.rejeitaImageView.alpha = 0.0
                    
                }else{
                    
                    card.aceitaImageView.alpha = 0.0
                    card.rejeitaImageView.alpha = rotateAngle * 5 * -1
                    
                }
                
                card.transform = CGAffineTransform(rotationAngle: rotateAngle)
                
                if gesture.state == .ended {
                    
                    if card.center.x > self.view.bounds.width + 50 {
                        self.animarCard(rotationAngle: rotateAngle, acao: .aceita)
                        return
                    }
                    
                    if card.center.x < -50 {
                        self.animarCard(rotationAngle: rotateAngle, acao: .rejeita)
                        return
                    }
                    
                    UIView.animate(withDuration: 0.2) {
                        card.center = self.view.center
                        card.transform = .identity
                        card.aceitaImageView.alpha = 0.0
                        card.rejeitaImageView.alpha = 0.0
                        
                    }
                }
            }
        }
        
        func  animarCard(rotationAngle:  CGFloat, acao: Acao) {
            if let alimento = self.alimentos.first{
                for view in self.view.subviews{
                    if view.tag == alimento.id{
                        if let card = view as? CombineCardView {
                            
                            let center: CGPoint
                            
                            switch acao {
                            case .aceita:
                                center = CGPoint(x: card.center.x + self.view.bounds.width, y: card.center.y + 50)
                                print(card.tag)
                            case .rejeita:
                                center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            }
                            
                            UIView.animate(withDuration: 0.4, animations: {
                                
                                card.center = center
                                card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                                
                            }) { (_) in
                                self.removerCard(card: card)
                            }
                            
                        }
                    }
                }
            }
        }
        
    }

