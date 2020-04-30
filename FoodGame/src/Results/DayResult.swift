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
      
      let sumOfNutrients = (mealDict["\(meal)"]!.carbohydrates + mealDict["\(meal)"]!.proteins + mealDict["\(meal)"]!.vegetables)/3
      
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
  
  // Função que dá a dica em relação à refeição
  func givingTips(coloredStars: Int) {
    
    switch coloredStars {
    case 0..<3:
      labelMealTips.text = "Você não comeu nada, coma alguma coisa"
      break
    case 3..<6:
      labelMealTips.text = "Um pouquinho mais de cada comida"
      break
    case 6..<9:
      labelMealTips.text = "Você deve comer mais alimentos amiguinho"
      break
    case 9..<12:
      labelMealTips.text = "Está chegando lá, coma mais coisas"
      break
    case 12..<15:
      labelMealTips.text = "Está quase lá, faltou só um pouquinho"
      break
    default:
      labelMealTips.text = "UMA REFEIÇÃO PERFEITA!!!"
      break
    }
  }
    
    @IBAction func voltaTela()
    {
        navigationController?.popToRootViewController(animated: true) 
    }
}
