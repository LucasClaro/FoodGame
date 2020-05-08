import UIKit

class LaunchScreenViewController: UIViewController {
  
  // MARK: View Lifecycle
    var timer : Timer!
    override func viewDidLoad() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {
            timer in
            self.performSegue(withIdentifier: "VaiMenu", sender: nil)
        })
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: false)
    timer.invalidate()
  }
}

