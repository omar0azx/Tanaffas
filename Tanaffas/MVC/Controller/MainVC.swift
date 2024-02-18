//
//  ViewController.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import UIKit
import CoreML
import Vision

class MainVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
        
    @IBOutlet weak var circularProgressView: CircularProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let ratio = UserDefaults.standard.ratio(forKey: "depressionRatio") {
            titleLabel.text = "النسبة المتوقعة من الإختبار"
            circularProgressView.setProgress(Float(ratio) / 100, animated: true)
            percentLabel.text = "\(ratio)%"
        } else {
            titleLabel.text = "لم تختبر بعد، اضغط زر الزائد"
            circularProgressView.setProgress(0, animated: true)
            percentLabel.text = "0%"
        }
    }
    
}
