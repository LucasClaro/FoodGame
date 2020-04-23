import UIKit

struct Meal {
  var carbohydrates = 0
  var proteins = 0
  var vegetables = 0
}

class MealViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  
  @IBOutlet weak var labelCurrentMeal: UILabel!
  
  @IBOutlet weak var labelQuantityOfCarbohydrates: UILabel!
  @IBOutlet weak var labelQuantityOfProteins: UILabel!
  @IBOutlet weak var labelQuantityOfVegetables: UILabel!
  
  @IBOutlet weak var labelMealTips: UILabel!
  
  @IBOutlet weak var uiViewMealInfos: UIView!
  
  @IBOutlet weak var buttonHome: UIButton!
  @IBOutlet weak var buttonDish: UIButton!
  @IBOutlet weak var buttonNextMeal: UIButton!
  
  @IBOutlet var arrayOfStars: [UIImageView]!
  
  // Logic Variables
  var mealDict:[String:Meal] = [:]
  
  var currentMeal : String = ""
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkCurrentMeal()
    
    adjustLayout()
   
    labelQuantityOfCarbohydrates.text = "Carboidratos: \(mealDict["\(currentMeal)"]!.carbohydrates)/5"
    labelQuantityOfProteins.text = "Proteinas: \(mealDict["\(currentMeal)"]!.proteins)/5"
    labelQuantityOfVegetables.text = "Vegetais: \(mealDict["\(currentMeal)"]!.vegetables)/5"

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

