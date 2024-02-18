//
//  DiagnosisVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 08/08/1445 AH.
//

import UIKit

var backNav = false

class DiagnosisVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?

    @IBOutlet weak var circularProgressView: CircularProgressView!
    
    @IBOutlet weak var PercentLabel: UILabel!
    
    @IBOutlet weak var percentMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let ratio = UserDefaults.standard.ratio(forKey: "depressionRatio") {
            circularProgressView.setProgress(Float(ratio) / 100, animated: true)
            PercentLabel.text = "\(ratio)%"
            switch ratio {
            case 20...39:
                percentMessage.text = "الأمور بخير"
            case 40...59:
                percentMessage.text = "أزمه وتعدي"
            case 60...79:
                percentMessage.text = "يبغالك تراجع نفسك وافعالك اليومية"
            case 80...100:
                percentMessage.text = "يبغالك تغيّر نمط حياتك"
            default:
                print("error")
            }
        } else {
            circularProgressView.setProgress(0, animated: true)
            PercentLabel.text = "0%"
            percentMessage.text = "ما فيك إلا العافية"
        }
        
    }
    
    @IBAction func backBTN(_ sender: UIButton) {
        backNav = true
        dismiss(animated: true)
    }
    
}
