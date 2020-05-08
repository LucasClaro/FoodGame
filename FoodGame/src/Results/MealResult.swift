import UIKit
import Foundation

struct Meal {
  var carbohydrates = 0
  var proteins = 0
  var vegetables = 0
  var fruta = 0
  var bebida = 0
}

class MealViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  
  @IBOutlet weak var labelCurrentMeal: UILabel!
    @IBOutlet weak var avaliacao: UILabel!
    
  @IBOutlet weak var labelQuantityOfCarbohydrates: UILabel!
  @IBOutlet weak var labelQuantityOfProteins: UILabel!
  @IBOutlet weak var labelQuantityOfVegetables: UILabel!
  @IBOutlet weak var labelQuantityOfFruits: UILabel!
  @IBOutlet weak var labelQuantityOfLiquid: UILabel!
  
  @IBOutlet weak var labelMealTips: UILabel!
  
  @IBOutlet weak var uiViewMealInfos: UIView!
  
  @IBOutlet weak var buttonHome: UIButton!
  @IBOutlet weak var buttonDish: UIButton!
  @IBOutlet weak var buttonNextMeal: UIButton!
  
  @IBOutlet var arrayOfStars: [UIImageView]!
  
    @IBOutlet weak var btnProb: UIButton!
    // Logic Variables
  var mealDict:[String:Meal] = [:]
  
  var currentMeal : String = ""
    
  var alimentosAceitos : [Alimento] = []

  var dicCondtions: [String: String] =  ["Diabetes": "\nComo você tem diabetes, não pode consumir ",
  "Hipertensao": "\nComo você tem hipertensão, não pode consumir ",
  "Lactose": "\nComo você tem intolerância à lactose, não pode consumir ",
  "Gastrite": "\nComo você tem gastrite, não pode consumir ",
  "Gluten": "\nComo você tem intolerância ao gluten, não pode consumir "]

    
  var textoCondicoes : [String] = []
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkCurrentMeal()
    
    adjustLayout()
   
    labelQuantityOfCarbohydrates.text = "Carboidratos:       \(mealDict["\(currentMeal)"]!.carbohydrates) / \(Calculo.maxValue.gCarbo)"
    labelQuantityOfProteins.text = "Proteinas:           \(mealDict["\(currentMeal)"]!.proteins) / \(Calculo.maxValue.gProt)"
    labelQuantityOfVegetables.text = "Vegetais:             \(mealDict["\(currentMeal)"]!.vegetables) / \(Calculo.maxValue.gVeg)"
    labelQuantityOfFruits.text = "Frutas:                      \(mealDict["\(currentMeal)"]!.fruta) / \(Calculo.maxValue.uFruta)"
    labelQuantityOfLiquid.text = "Líquidos:            \(mealDict["\(currentMeal)"]!.bebida) / \(Calculo.maxValue.mlBeb)"
    
    coloringStars()
    
    btnProb.isHidden = textoCondicoes.count == 0
  }
  
  // MARK: Layout Methods
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
  func adjustLayout() {
    
    switch currentMeal {
    case "Café":
      view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.7450980392, blue: 0.1725490196, alpha: 1)
      break
    case "Almoço":
      view.backgroundColor = #colorLiteral(red: 0.5764705882, green: 0.6588235294, blue: 1, alpha: 1)
      break
    case "Janta":
      view.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.2745098039, blue: 0.4431372549, alpha: 1)
      break
    default:
      print("Erro na troca de cores da tela")
    }

    uiViewMealInfos.layer.cornerRadius = 30
    buttonDish.layer.cornerRadius = 30
    buttonNextMeal.layer.cornerRadius = 30
    buttonHome.layer.cornerRadius = 30
    btnProb.layer.cornerRadius = 30
  }
  
  // MARK: Internal Logic Methods
  
  //Verifica se o Index é "Janta", e liga o avançar
  func checkCurrentMeal() {
    if currentMeal == "Janta" {
      buttonNextMeal.setTitle("Como foi seu dia", for: .normal)
    }
  }
  
  //Verifica se o Index é "Janta", e troca a segue do botão
  @IBAction func nextMeal(_ sender: UIButton) {
    if currentMeal != "Janta" {
      performSegue(withIdentifier: "GameVC", sender: nil)

    } else {
      performSegue(withIdentifier: "DayResultVC", sender: nil)
      
    }
  }
  
  
  // Função que colore as estrelas para dar a "nota" ao jogador
  func coloringStars() {
    let sumOfNutrients = calcPerNutrient()
    givingTips(sumOfNutrients: sumOfNutrients)
    
    for star in arrayOfStars {
      if star.tag <= sumOfNutrients {
        star.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
      }
    }
    verConditions()
  }
  
  // Função que dá a dica da refeição
  func givingTips(sumOfNutrients: Int) {
    
    switch sumOfNutrients {
    case 0:
      labelMealTips.text = NSLocalizedString("refeicaoMtRuim", comment: "Aviso que aparece quando a pontuação do usuário é entre 0 e 3")
      avaliacao.text = "Poxa vida..."
      break
    case 1:
      labelMealTips.text = NSLocalizedString("refeicaoRuim", comment: "Aviso que aparece quando a pontuação do usuário é entre 3 e 6")
      avaliacao.text = "Poxa vida..."
      break
    case 2:
      labelMealTips.text = NSLocalizedString("refeicaoOk", comment: "Aviso que aparece quando a pontuação do usuário é entre 6 e 9")
      avaliacao.text = "Ok!"
      break
    case 3:
      labelMealTips.text = NSLocalizedString("refeicaoBoa", comment: "Aviso que aparece quando a pontuação do usuário é entre 9 e 12")
      avaliacao.text = "Oba!"
      break
    case 4:
      labelMealTips.text = NSLocalizedString("refeicaoMtBoa", comment: "Aviso que aparece quando a pontuação do usuário é entre 12 e 15")
      avaliacao.text = "Uau!"
      break
    default:
      labelMealTips.text = NSLocalizedString("refeicaoPft", comment: "Aviso que aparece caso a refeição tenha sido perfeita")
      avaliacao.text = "Parabéns..."
      break
    }
  }
  
    func calcPerNutrient() -> Int {
      
      let totalNutrientes = (Calculo.maxValue.gCarbo + Calculo.maxValue.gProt + Calculo.maxValue.gVeg + Float(Calculo.maxValue.uFruta * 100) + Calculo.maxValue.mlBeb)
        
        let carb = abs(Float32(mealDict["\(currentMeal)"]!.carbohydrates) - Calculo.maxValue.gCarbo)
        let prot = abs(Float32(mealDict["\(currentMeal)"]!.proteins) - Calculo.maxValue.gProt)
        let veg = abs(Float32(mealDict["\(currentMeal)"]!.vegetables) - Calculo.maxValue.gVeg)
        
        let fruta = abs(mealDict["\(currentMeal)"]!.fruta - Calculo.maxValue.uFruta)
        
        let bebs = abs(Float32(mealDict["\(currentMeal)"]!.bebida) - Calculo.maxValue.mlBeb)
        
        let somaNutrientes = carb+prot+veg + Float(fruta*100) + bebs
      
        switch somaNutrientes {
        case ..<(totalNutrientes*0.10):
          //5%
          return 5
        case ..<(totalNutrientes*0.20):
          //10%
          return 4
        case ..<(totalNutrientes*0.35):
          //25%
          return 3
        case ..<(totalNutrientes*0.50):
          //50%
          return 2
        case ..<(totalNutrientes*0.75):
          //75%
          return 1
        default:
          //0 Estrelas
          return 0
        }
    }
  
     func verConditions()
       {
           ///["Diabetes", "Hipertensao", "Lactose", "Vegetariano", "Gastrite", "Gluten"]
           let con = (UserDefaults.standard.dictionary(forKey: "Condicoes") as! [String:Bool])
           
           
           for a in alimentosAceitos
           {
               for i in 0 ... a.restricoes.count - 1
               {
                   if con[a.restricoes[i]] ?? false
                   {
                       //textoCondicoes.append("\n- Como você tem " + dicCondtions[a.restricoes[i]]! + ", nao pode consumir " + a.nome + "!")
                       dicCondtions[a.restricoes[i]]! += (a.nome+", ")
                   }
               }
           }
        for c in dicCondtions.keys
        {
            if con[c] ?? false
            {
                if !dicCondtions[c]!.hasSuffix("consumir "){
                    textoCondicoes.append(dicCondtions[c]!)
                }
            }
        }
       }
    
  // MARK: View Data Output
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    /*guard let dayViewController = segue.destination as? DayViewController
      else {
        return
    }*/
    if let dayViewController = segue.destination as? DayViewController {
        dayViewController.mealDict = mealDict
    }
    else if let pratoTableVC = segue.destination as? PratoTableVC{
        pratoTableVC.mealDict = mealDict
        pratoTableVC.currentMeal = currentMeal
        pratoTableVC.alimentos = alimentosAceitos
    }
    else if let probVC = segue.destination as? ProblemViewController{
        probVC.texto = textoCondicoes
    }
    
  }

  @IBAction func goMenu(_ sender: Any) {
      let alert = UIAlertController(title: "Deseja mesmo voltar ao menu?", message: "Saindo você perderá todo o progresso atual", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.performSegue(withIdentifier: "unwindToMenu", sender: nil)}))
    alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
      
      self.present(alert, animated: true)
  }

}

