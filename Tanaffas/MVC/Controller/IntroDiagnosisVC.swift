//
//  IntroDiagnosisVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import UIKit

class IntroDiagnosisVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if backNav {
            self.dismiss(animated: false)
        }
    }
    
    @IBAction func backBTN(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
