//
//  TutorialViewController.swift
//  proofPageView
//
//  Created by Igor Kenzo Miyamoto Dias on 08/04/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, TutorialPageViewControllerDelegate {
    //MARK: Outlets
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
    var tutorialPageViewController : TutorialPageViewController?
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK:Funcoes
    @IBAction func nextButtonTapped()
    {
        if let index = tutorialPageViewController?.currentIndex {
            switch index {
                case 0:
                    tutorialPageViewController?.fowardPage()
                case 1:
                    dismiss(animated: true, completion: nil)
                
                default : break
            }
        }
        updateUI()
    }
    
    @IBAction func skipTutorial(sender: UIButton)
    {
        UserDefaults.standard.set(true, forKey: "fezTutorial")
        performSegue(withIdentifier: "PersonagemVC", sender: nil)
    }
    
    func updateUI() {
        if let index = tutorialPageViewController?.currentIndex {
            switch index {
            case 0:
                btnNext.setTitle("Próximo", for: .normal)
                btnSkip.isHidden = false
            case 1:
                btnNext.setTitle("Jogar", for: .normal)
                btnNext.addTarget(self, action: #selector(irParaPersonagem), for: UIControl.Event.touchUpInside)
                btnSkip.isHidden = true
                
            default: break
            }
            pageController.currentPage = index
        }
    }

    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    @IBAction func btnJogarPressed(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "fezTutorial")
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let pageViewController = segue.destination as? TutorialPageViewController {
            tutorialPageViewController = pageViewController
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
  @objc func irParaPersonagem() {
    performSegue(withIdentifier: "PersonagemVC", sender: nil)
  }
    

}
