//
//  TutorialPageViewController.swift
//  proofPageView
//
//  Created by Igor Kenzo Miyamoto Dias on 08/04/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

protocol TutorialPageViewControllerDelegate : class {
    func didUpdatePageIndex(currentIndex: Int)
}

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // MARK: Valores tutorial
    
    //TOP
    let titleTu = ["Como funciona?","Leve em conta"]
    let pageHeadingsTop = ["Navegação intuitiva","Alimentos"]
    let pageSubHeadingsTop = ["Aceite ou negue um alimeto simplesmente arrastando o card.","Sempre disponiveis para consulta no prato."]
    
    let pageImagesTop = ["IconsCard.png","IconsCard.png"]
    
    //MID
    let pageHeadingsMid = ["Monte um prato","Porções"]
    let pageSubHeadingsMid = ["Escolha os alimentos corretos para montar um prato saudável.","Leve em conta a quantidade que está sendo colocada no prato."]
    
    let pageImagesMid = ["IconsPrato.png","IconsPrato.png"]
    
    
    //BOT
    let pageHeadingsBot = ["Personagem","Condições"]
    let pageSubHeadingsBot = ["Leve em conta as condições do seu personagem.","Suas condições farão diferença na hora do resultado."]
    
    let pageImagesBot = ["IconsPersonagem.png","IconsPersonagem.png"]
    
    weak var tutorialDelegate : TutorialPageViewControllerDelegate?
    
    var currentIndex = 0
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        if let initialViewController = contentViewController(at: 0) {
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    //MARK: DataSource e Delegate
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).index

        index -= 1
        
        return contentViewController(at:  index)
      }
      
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
          var index = (viewController as! TutorialContentViewController).index
          
          index += 1
          
          return contentViewController(at:  index)
      }
    
    
    func contentViewController(at index : Int) -> TutorialContentViewController? {
        if(index < 0 || index >= titleTu.count){
            return nil
        }
        
        if let pageContentViewController = UIStoryboard.init(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: "TutorialContentViewController") as? TutorialContentViewController {
            pageContentViewController.titleText = titleTu[index]
            
            pageContentViewController.imageFileTop = pageImagesTop[index]
            pageContentViewController.headingTop = pageHeadingsTop[index]
            pageContentViewController.subHeadingTop = pageSubHeadingsTop[index]
            
            pageContentViewController.imageFileMid = pageImagesMid[index]
            pageContentViewController.headingMid = pageHeadingsMid[index]
            pageContentViewController.subHeadingMid = pageSubHeadingsMid[index]
            
            pageContentViewController.imageFileBot = pageImagesBot[index]
            pageContentViewController.headingBot = pageHeadingsBot[index]
            pageContentViewController.subHeadingBot = pageSubHeadingsBot[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? TutorialContentViewController {
                currentIndex = contentViewController.index
                
                tutorialDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    //MARK: Funcao para btnNext
    func fowardPage()
    {
        currentIndex += 1
        if let nextViewControllers = contentViewController(at: currentIndex){
            setViewControllers([nextViewControllers], direction: .forward, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
