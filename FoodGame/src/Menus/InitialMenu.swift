import UIKit
import AVFoundation
class InitialMenuViewController: UIViewController {
  
  // MARK: Variables
  
  // ViewController objects
  @IBOutlet weak var buttonConfiguration: UIButton!
  @IBOutlet weak var buttonPlay: UIButton!
  
  var player = AVAudioPlayer()
    
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buttonPlay.layer.cornerRadius = 10
    buttonConfiguration.layer.cornerRadius = 10
    let mv = UserDefaults.standard.float(forKey: "musicVol")
    //let sv = UserDefaults.standard.float(forKey: "soundVol")

     player = AVAudioPlayer()
     do {
         let path = Bundle.main.path(forResource: "soviet-anthem", ofType: "mp3")
         try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
         player.prepareToPlay()
         player.volume = mv
         player.play()
     }
     catch {
         print(error)
     }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let configViewController = segue.destination as? ConfigViewController {
            configViewController.volumeChangedDelegate = self
        }
    }
  
  @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    
  }
  
  @IBAction func play(_ sender: UIButton) {
    //UserDefaults.standard.set(false, forKey: "fezTutorial")
    if !UserDefaults.standard.bool(forKey: "fezTutorial") {
      performSegue(withIdentifier: "Game", sender: nil)
    } else {
      performSegue(withIdentifier: "PersonagemVC", sender: nil)
    }
  }
  

}

extension InitialMenuViewController : VolumeChangedDelegate {
 
    func changeVol(sender: UISlider,key : String) {
        player.volume = sender.value
        UserDefaults.standard.set(sender.value, forKey: key)
    }
    
    
}
