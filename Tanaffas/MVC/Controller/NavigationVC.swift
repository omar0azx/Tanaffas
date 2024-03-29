//
//  NavigationVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import UIKit

class NavigationVC: ContainerVC, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var bottomBarView: DesignableView!
    
    @IBOutlet var navImage: [UIImageView]!

    @IBOutlet var navButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCurvedView()
        
        self.navigate(to: 3)
        for (index, button) in navButton.enumerated() {
            button.tag = index
        }
        self.navigationItem.hidesBackButton = true
    }
    
    func navigate(to selectedIndex: Int, animated: Bool = false) {
        var views = viewControllers.map(\.view)
        let selectedView = views.remove(at: selectedIndex)
        for unselectedView in views { unselectedView?.isHidden = true }
        selectedView?.isHidden = false
        
    }
    
    let shapeLayer = CAShapeLayer()

    func setupCurvedView() {
        let width = view.frame.width - 40
        let height = bottomBarView.frame.height
        
        let path = UIBezierPath(rect: bottomBarView.frame)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (width / 2 ) - 62.5, y: 0))
        
        //before Center curve
        path.addArc(withCenter: CGPoint(x: (width / 2 ) - 52.5, y: 17.5), radius: 17.5,
                    startAngle: 3 * .pi/2 , endAngle: 11 * .pi / 6 , clockwise: true)
        
        //Center curve
        path.addArc(withCenter: CGPoint(x: (width / 2 ) , y: 5), radius: 35,
                    startAngle: 5 * .pi / 6  , endAngle:  .pi / 6 , clockwise: false)
        
        //after Center curve
        path.addArc(withCenter: CGPoint(x: (width / 2 ) + 52.5, y: 17.5), radius: 17.5,
                    startAngle: 7 * .pi / 6  , endAngle: 3 * .pi/2 , clockwise: true)
        
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor(named: "Tanaffas")?.cgColor
        
        bottomBarView.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if self.traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            shapeLayer.fillColor = UIColor.systemGray6.cgColor
        }
    }
    
    func updateShapeLayerColor() {
        if self.traitCollection.userInterfaceStyle == .dark {
            shapeLayer.fillColor = UIColor.red.cgColor
        } else {
            shapeLayer.fillColor = UIColor.blue.cgColor
        }
    }
    
    func changeImageColor(index: Int) {
        for num in 0...3 {
            if num == index {
                self.navImage[num].tintColor = UIColor(named: "standr")
            } else {
                self.navImage[num].tintColor = UIColor.systemGray
            }
        }
    }
    
    @IBAction func didPressNavButton(_ sender: UIButton) {
        
        if sender.tag < viewControllers.count {
            switch sender.tag {
                
            case 0:
                navigate(to: 0, animated: true)
                UIView.animate(withDuration: 0.1) {
                    self.changeImageColor(index: 0)
                    self.view.layoutIfNeeded()
                }
            case 1:
                navigate(to: 1, animated: true)
                UIView.animate(withDuration: 0.1) {
                    self.changeImageColor(index: 1)
                    self.view.layoutIfNeeded()
                }
            case 2:
                navigate(to: 2, animated: true)
                UIView.animate(withDuration: 0.1) {
                    self.changeImageColor(index: 2)
                    self.view.layoutIfNeeded()
                }
            case 3:
                navigate(to: 3, animated: true)
                UIView.animate(withDuration: 0.1) {
                    self.changeImageColor(index: 3)
                    self.view.layoutIfNeeded()
                }
            default:
                print("")
            }
            //        navigate(to: sender.tag, animated: true)
        }
    }
    
    @IBAction func newDignosis(_ sender: UIButton) {
        coordinator?.viewIntroDiagnosisVC()
    }

}

