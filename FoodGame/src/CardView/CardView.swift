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
  
    // MARK: Variables
    
    // ViewController objects
    @IBOutlet weak var buttonPause: UIButton!
    @IBOutlet weak var buttonCharacter: UIButton!
    @IBOutlet weak var buttonDish: UIButton!
  
    @IBOutlet weak var labelCurrentMeal: UILabel!
    // Logic variables
  
    var alimentos : [Alimento] = []
    var alimentosAceitos : [Alimento] = []
    var qtdCards : Int = 0
    
    var mealDict = ["Café": Meal(),
                     "Almoço": Meal(),
                     "Janta": Meal()]
     
    var currentMeal = "Café"
  
    // Modificação
    var vetorDeCards : [CombineCardView] = []
    
    @IBOutlet weak var card: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //  card.CombineCardView()
            
        self.buscaAlimentos()
        qtdCards = alimentos.count
        Calculo.definirValoresMax()
        adjustLayout()
    }
  
    //Função para desaparecer com a NavBar
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //Função para aparecer com a NavBar
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      navigationController?.setNavigationBarHidden(false, animated: false)
    }
  
    //Função que ajusta a parte visual do layout
    func adjustLayout() {
      buttonDish.layer.cornerRadius = 30
      buttonPause.layer.cornerRadius = 30
      buttonCharacter.layer.cornerRadius = 30
      
      labelCurrentMeal.text = currentMeal
    }
  
  // Altera a refeição atual para a próxima refeição
  func changeMeal(){
    switch currentMeal {
    case "Café":
      currentMeal = "Almoço"
      view.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.6588235294, blue: 1, alpha: 1)
      break
    case "Almoço":
      currentMeal = "Janta"
      view.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.2745098039, blue: 0.4431372549, alpha: 1)
      labelCurrentMeal.textColor = .white
      break
    default:
      currentMeal = "Café"
      view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7450980392, blue: 0.1725490196, alpha: 1)
      labelCurrentMeal.textColor = .black
    }
    
    labelCurrentMeal.text = currentMeal
  }
    
    func buscaAlimentos(){
        
        var lista : [Alimento] = []
        
        lista = AlimentoService.shared.buscaCarboidratos()
        lista.shuffle()
        for index in 0...2{
            alimentos.append(lista[index])
        }
        
        lista = AlimentoService.shared.buscaLeguminosas()
        lista.shuffle()
        for index in 0...1{
            alimentos.append(lista[index])
        }
        
        lista = AlimentoService.shared.buscaProteinas()
        lista.shuffle()
        for index in 0...3{
            alimentos.append(lista[index])
        }
        
        lista = AlimentoService.shared.buscaProteinasVegetais()
        lista.shuffle()
        for index in 0...1{
            alimentos.append(lista[index])
        }
        
        lista = AlimentoService.shared.buscaHortlicas()
        lista.shuffle()
        for index in 0...4{
            alimentos.append(lista[index])
        }
        
        alimentos.shuffle()
        
        self.adicionarCards()
    }
}

extension CardViewController {
    func adicionarCards(){
      // Modificação
      vetorDeCards.removeAll()
            
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
            
            // Modificação
            cards.isHidden = true
                
            card = cards
            view.insertSubview(card, at: 1)
          
            // Modificação adicionada pelo Jader para ordenar as cards num vetor
            vetorDeCards.append(cards)
        }
        //Modificação
        for index in 0...1 {
          vetorDeCards[index].isHidden = false
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
                            //print(card.tag)
                            alimentosAceitos.append(alimento)
                            verificaQtdCards()
                        case .rejeita:
                            center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            verificaQtdCards()
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
    
    //Conta a quantidade de cards quando não tiver mais nenhum, avança para outra tela
    func verificaQtdCards()
    {
        // Modificação
        if !(qtdCards <= 2) {
          let indexVetorCards = (qtdCards - vetorDeCards.count - 2) * (-1)
          vetorDeCards[indexVetorCards].isHidden = false
        }
      
      
        qtdCards -= 1
        if(qtdCards == 0)
        {
            calculaAlimentacao()
            performSegue(withIdentifier: "resultado", sender: nil)
        }
    }
    
    //Separa os alimentos por tipo e calcula os tipos
    func calculaAlimentacao()
    {
        Calculo.aliPorTipo = Calculo.separarTipos(alimentos: alimentosAceitos)
        mealDict[currentMeal]?.carbohydrates = Calculo.calularCarbo()
        mealDict[currentMeal]?.proteins = Calculo.calularProteina()
        mealDict[currentMeal]?.vegetables = Calculo.calcularVegetais()
    }
    
    //MARK: SEGUES
    
    // Função que vê para qual ViewController está seguindo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Caso seja a MealViewController:
      /*guard let mealViewController = segue.destination as? MealViewController
        else {
          return
      }*/
        if let mealViewController = segue.destination as? MealViewController{
            // Leva o dicionário e a refeição atual dessa ViewController para a MealViewController.
            mealViewController.mealDict = mealDict
            mealViewController.currentMeal = currentMeal
            mealViewController.alimentosAceitos = alimentosAceitos
        }
        else if let pratoTableVC = segue.destination as? PratoTableVC{
            calculaAlimentacao()
            pratoTableVC.mealDict = mealDict
            pratoTableVC.currentMeal = currentMeal
            pratoTableVC.alimentos = alimentosAceitos
        }
      
    }
    
    // Função que vê qual ViewController está acessando essa ViewController
    @IBAction func unwind(segue: UIStoryboardSegue) {
      // Caso seja a MealViewController:
      if segue.source is MealViewController {
        
        changeMeal()
        
        self.buscaAlimentos()
        qtdCards = alimentos.count
        alimentosAceitos.removeAll()
      }
      
      if segue.source is DayViewController {
        
        changeMeal()
        
        self.buscaAlimentos()
        qtdCards = alimentos.count
        alimentosAceitos.removeAll()
      }
      
      if segue.source is PauseVC {
        
        for card in vetorDeCards{
           self.removerCard(card: card)
        }
        
        vetorDeCards.removeAll()
        
        
        self.buscaAlimentos()
        qtdCards = alimentos.count
        alimentosAceitos.removeAll()
      }
    }
}
