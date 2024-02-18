//
//  DiagnosisVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import UIKit
import Lottie

class QuestionsVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerLaber: [UILabel]!
    
    @IBOutlet weak var quizTime: UILabel!
    @IBOutlet weak var quizzCount: UILabel!
    @IBOutlet weak var progressBarView: DesignableView!
    @IBOutlet weak var progressWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var animationForStart: LottieAnimationView!
    
    @IBOutlet weak var viewEffect: UIView!
    @IBOutlet weak var labelForAnimation: UILabel!
    
    var allQuestions = QuestionBank()
    var numQuestions = 0
    var score = 0
    var countDown = 1800
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.lottieAnimation("starting")
        if self.view.frame.height > 990 {
            self.questionLabel.font = UIFont.systemFont(ofSize: 35)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            UIView.animate(withDuration: 3, delay: 0.4) {
                self.viewEffect.isHidden = true
                self.startTimer()
                self.nextQuestion()
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if backNav {
            self.dismiss(animated: false)
        }
    }
    
    
    func lottieAnimation(_ type: String) {
        self.viewEffect.isHidden = false
        animationForStart.animation = LottieAnimation.named(type)
        animationForStart.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationForStart.contentMode = .scaleAspectFit
        animationForStart.play()
    }
    
    @IBAction func answerButton(_ sender: AnyObject) {
        
        switch sender.tag {
        case 0:
            score += 0
        case 1:
            score += 1
        case 2:
            score += 2
        case 3:
            score += 3
        default:
            print("error in quizzVC")
        }
        updateUI()
        numQuestions = numQuestions + 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        quizzCount.text = "\(numQuestions + 1) | 21"
        progressWidth.constant = (view.frame.size.width / 21) * CGFloat(numQuestions + 1)
    }
    
    
    func nextQuestion() {
        var timeOfQuizz = quizTime.text
        timeOfQuizz?.removeLast(5)
        if numQuestions <= 20 {
            questionLabel.text = allQuestions.list[numQuestions].questionText
            
            for i in 0...3 {
                if self.view.frame.height > 990 {
                    self.answerLaber[i].font = UIFont.systemFont(ofSize: 30)
                }
                answerLaber[i].text = allQuestions.list[numQuestions].questionAnswer[i]
            }
        } else {
            self.lottieAnimation("completed")
            var total = Double(temp) + (Double(score) / 63.0) * 50.0
            labelForAnimation.text = "نهاية الإختبار..."
            UserDefaults.standard.setRatio(Int(total), forKey: "depressionRatio")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                if let diagnosisVC = self.storyboard?.instantiateViewController(identifier: "DiagnosisVC") as? DiagnosisVC {
                    diagnosisVC.modalPresentationStyle = .fullScreen
                    self.present(diagnosisVC, animated: true, completion: nil)
                }
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() {
        var completionTime = quizTime.text
        completionTime?.removeLast(5)
        countDown = countDown - 1
        let time = secondsToMinutesSeconds(seconds: countDown)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        quizTime.text = timeString
    }
    
    func secondsToMinutesSeconds(seconds: Int) -> (Int, Int) {
        return (((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    func makeTimeString(minutes: Int, seconds : Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

