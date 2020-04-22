import UIKit

class FoodGameViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  @IBOutlet weak var buttonPause: UIButton!
  @IBOutlet weak var buttonCharacter: UIButton!
  
  @IBOutlet weak var buttonDish: UIButton!
  
  @IBOutlet weak var labelCurrentMeal: UILabel!
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    adjustLayout()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
  // MARK: Layout Methods
  
  func adjustLayout() {
    buttonDish.layer.cornerRadius = 30
    buttonPause.layer.cornerRadius = 30
    buttonCharacter.layer.cornerRadius = 30
  }
}
