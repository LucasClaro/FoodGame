import UIKit

class GameViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  @IBOutlet weak var labelCurrentMeal: UILabel!
  
  @IBOutlet weak var stepperCarbohydrates: UIStepper!
  @IBOutlet weak var stepperProteins: UIStepper!
  @IBOutlet weak var stepperVegetables: UIStepper!
  
  @IBOutlet weak var labelQuantityOfCarbohydrates: UILabel!
  @IBOutlet weak var labelQuantityOfProteins: UILabel!
  @IBOutlet weak var labelQuantityOfVegetables: UILabel!
  
  // Logic variables
  var mealDict = ["Café": Meal(),
                  "Almoço": Meal(),
                  "Janta": Meal()]
  
  var currentMeal = "Café"
  
  // MARK: View Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Desligando as NavBar da NavController
    navigationController?.setNavigationBarHidden(true, animated: animated)
    
    stepperCarbohydrates.value = 0
    stepperProteins.value = 0
    stepperVegetables.value = 0
    
    labelCurrentMeal.text = currentMeal
    
    labelQuantityOfCarbohydrates.text = String(mealDict[currentMeal]!.carbohydrates)
    labelQuantityOfProteins.text = String(mealDict[currentMeal]!.proteins)
    labelQuantityOfVegetables.text = String(mealDict[currentMeal]!.vegetables)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Religando as NavBar da NavController
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  // MARK: User Interaction
  
  // Altera a quantidade de carboidratos da refeição atual
  @IBAction func alterCarbohydrates(_ sender: UIStepper) {
    mealDict[currentMeal]?.carbohydrates = Int(sender.value)
    labelQuantityOfCarbohydrates.text = String(mealDict[currentMeal]!.carbohydrates)
  }
  
  // Altera a quantidade de proteínas da refeição atual
  @IBAction func alterProteins(_ sender: UIStepper) {
    mealDict[currentMeal]?.proteins = Int(sender.value)
    labelQuantityOfProteins.text = String(mealDict[currentMeal]!.proteins)
  }
  
  // Altera a quantidade de vegetais da refeição atual
  @IBAction func alterVegetables(_ sender: UIStepper) {
    mealDict[currentMeal]?.vegetables = Int(sender.value)
    labelQuantityOfVegetables.text = String(mealDict[currentMeal]!.vegetables)
  }
  
  // MARK: View Data I/O
  
  // Função que vê para qual ViewController está seguindo
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Caso seja a MealViewController:
    guard let mealViewController = segue.destination as? MealViewController
      else {
        return
    }
    
    // Leva o dicionário e a refeição atual dessa ViewController para a MealViewController.
    mealViewController.mealDict = mealDict
    mealViewController.currentMeal = currentMeal
  }
  
  // Função que vê qual ViewController está acessando essa ViewController
  @IBAction func unwind(segue: UIStoryboardSegue) {
    // Caso seja a MealViewController:
    if segue.source is MealViewController {
      
      // Altera a refeição atual para a próxima refeição
      switch currentMeal {
      case "Café":
        currentMeal = "Almoço"
        break
      default:
        currentMeal = "Janta"
      }
    }
  }
}
