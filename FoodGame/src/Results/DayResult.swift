import UIKit

class DayViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  @IBOutlet weak var uiViewDayInfos: UIView!
  
  @IBOutlet weak var buttonPlayAgain: UIButton!
  @IBOutlet weak var buttonMenu: UIButton!
  
  @IBOutlet var labelMealTips: UILabel!
  
  @IBOutlet var arrayOfStars: [UIImageView]!
  
  // Logic Variables
  var mealDict:[String:Meal] = [:]
  
  var dayMealArray = ["Café","Almoço","Janta"]
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    adjustLayout()
    coloringStars()
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
    
    uiViewDayInfos.layer.cornerRadius = 30
    buttonPlayAgain.layer.cornerRadius = 30
    buttonMenu.layer.cornerRadius = 30
  }
  
  // MARK: Internal Logic Methods
  
  // Função que colore as estrelas baseada nas refeições
  func coloringStars() {
    
    var starListIndex = 0
    
    var quantityOfColoredStars = 0
    
    for meal in dayMealArray{
      
      let carb = abs(Float32(mealDict["\(meal)"]!.carbohydrates) - Calculo.maxValue.gCarbo)
      let prot = abs(Float32(mealDict["\(meal)"]!.proteins) - Calculo.maxValue.gProt)
      let veg = abs(Float32(mealDict["\(meal)"]!.vegetables) - Calculo.maxValue.gVeg)
      
      let fruta = abs(mealDict["\(meal)"]!.fruta - Calculo.maxValue.uFruta)
      
      let bebs = abs(Float32(mealDict["\(meal)"]!.bebida) - Calculo.maxValue.mlBeb)
      
      let somaNutrientes = carb+prot+veg + Float(fruta*100) + bebs
      
      let sumOfNutrients = calcPerNutrient(somaNutrientes: Float(somaNutrientes))
      
      for star in arrayOfStars {
        if starListIndex < star.tag && star.tag <= starListIndex+5 {
          if star.tag <= sumOfNutrients+starListIndex {
            star.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            quantityOfColoredStars += 1
          }
        }
      }
      
       starListIndex += 5
    }
    
    givingTips(coloredStars: quantityOfColoredStars)
    
  }
  
  func calcPerNutrient(somaNutrientes: Float) -> Int {
    
    let totalNutrientes = (Calculo.maxValue.gCarbo + Calculo.maxValue.gProt + Calculo.maxValue.gVeg + Float(Calculo.maxValue.uFruta * 100) + Calculo.maxValue.mlBeb)
    
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
  
  // Função que dá a dica em relação à refeição
  func givingTips(coloredStars: Int) {
    
    switch coloredStars {
    case 0..<3:
      labelMealTips.text = NSLocalizedString("entre0e3", comment: "Aviso que aparece quando a pontuação do usuário é entre 0 e 3")
      //"Você não comeu nada, coma alguma coisa"
      break
    case 3..<6:
      labelMealTips.text = NSLocalizedString("entre3e6", comment: "Aviso que aparece quando a pontuação do usuário é entre 3 e 6")
      //"Um pouquinho mais de cada comida"
      break
    case 6..<9:
      labelMealTips.text = NSLocalizedString("entre6e9", comment: "Aviso que aparece quando a pontuação do usuário é entre 6 e 9")
      //"Você deve comer mais alimentos amiguinho"
      break
    case 9..<12:
      labelMealTips.text = NSLocalizedString("entre9e12", comment: "Aviso que aparece quando a pontuação do usuário é entre 9 e 12")
      //"Está chegando lá, coma mais coisas"
      break
    case 12..<15:
      labelMealTips.text = NSLocalizedString("entre12e15", comment: "Aviso que aparece quando a pontuação do usuário é entre 12 e 15")
      //"Está quase lá, faltou só um pouquinho"
      break
    default:
      labelMealTips.text = NSLocalizedString("entre15e15", comment: "Aviso que aparece caso a refeição tenha sido perfeita")
      //"UMA REFEIÇÃO PERFEITA!!!"
      break
    }
  }
    
    @IBAction func voltaTela()
    {
        navigationController?.popToRootViewController(animated: true) 
    }
}
