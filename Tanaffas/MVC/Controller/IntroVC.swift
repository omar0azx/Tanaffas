//
//  IntroVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import Foundation
import UIKit
import Lottie

class IntroVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.view.frame.height < 750 {
            
        }
        self.navigationItem.hidesBackButton = true
        lottieAnimation()
    }
    
    func lottieAnimation() {
        animationView.animation = LottieAnimation.named( "calm")
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
    }
}
