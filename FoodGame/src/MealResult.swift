import UIKit

struct Meal {
  var carbohydrates = 0
  var proteins = 0
  var vegetables = 0
}

class MealViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  @IBOutlet weak var barButtonBack: UIBarButtonItem!
  @IBOutlet weak var barButtonGo: UIBarButtonItem!
  
  @IBOutlet weak var labelCurrentMeal: UILabel!
  
  @IBOutlet weak var labelQuantityOfCarbohydrates: UILabel!
  @IBOutlet weak var labelQuantityOfProteins: UILabel!
  @IBOutlet weak var labelQuantityOfVegetables: UILabel!
  
  @IBOutlet weak var labelMealTips: UILabel!
  
  @IBOutlet var arrayOfStars: [UIImageView]!
  
  // Logic Variables
  var mealDict:[String:Meal] = [:]
  
  var currentMeal : String = ""
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelCurrentMeal.text = currentMeal
    
    labelQuantityOfCarbohydrates.text = String(mealDict["\(currentMeal)"]!.carbohydrates)
    labelQuantityOfProteins.text = String(mealDict["\(currentMeal)"]!.proteins)
    labelQuantityOfVegetables.text = String(mealDict["\(currentMeal)"]!.vegetables)
    
    coloringStars()
    
    checkCurrentMeal()
  }
  
  // MARK: Internal Logic Methods
  
  //Verifica se o Index é "Janta", e liga o avançar
  func checkCurrentMeal() {
    if(currentMeal == "Janta") {
      barButtonBack.title = nil
      barButtonBack.isEnabled = false
      
      barButtonGo.title = "Avançar"
      barButtonGo.isEnabled = true
    }
  }
  
  // Função que colore as estrelas para dar a "nota" ao jogador
  func coloringStars() {
    let sumOfNutrients = (mealDict["\(currentMeal)"]!.carbohydrates + mealDict["\(currentMeal)"]!.proteins + mealDict["\(currentMeal)"]!.vegetables)/3
    
    givingTips(sumOfNutrients: sumOfNutrients)
    
    for star in arrayOfStars {
      if star.tag <= sumOfNutrients {
        star.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
      }
    }
  }
  
  // Função que dá a dica da refeição
  func givingTips(sumOfNutrients: Int) {
    
    switch sumOfNutrients {
    case 0:
      labelMealTips.text = "Você não comeu nada, coma alguma coisa"
      break
    case 1:
      labelMealTips.text = "Um pouquinho mais de cada comida"
      break
    case 2:
      labelMealTips.text = "Você deve comer mais alimentos amiguinho"
      break
    case 3:
      labelMealTips.text = "Está chegando lá, coma mais coisas"
      break
    case 4:
      labelMealTips.text = "Está quase lá, faltou só um pouquinho"
      break
    default:
      labelMealTips.text = "UMA REFEIÇÃO PERFEITA!!!"
      break
    }
  }
  
  
  // MARK: View Data Output
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let dayViewController = segue.destination as? DayViewController
      else {
        return
    }
    
    dayViewController.mealDict = mealDict
  }
}

