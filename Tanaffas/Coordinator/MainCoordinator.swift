//
//  MainCoordinator.swift
//  UJActivity
//
//  Created by omar alzhrani on 20/02/1444 AH.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: Initial View Controller
    func start() {
        
        let navigationVC = NavigationVC.instantiate()
        
        let introVC = IntroVC.instantiate()
        
        let loginVC = LoginVC.instantiate()
        
        let mainVC = MainVC.instantiate()
        let messageVC = MessageVC.instantiate()
        let notificationVC = NotificationVC.instantiate()
        let profileVC = ProfileVC.instantiate()
        
        loginVC.coordinator = self
        
        mainVC.coordinator = self
        messageVC.coordinator = self
        notificationVC.coordinator = self
        profileVC.coordinator = self
        navigationVC.coordinator = self
        
        navigationVC.viewControllers = [profileVC, notificationVC, messageVC, mainVC]
        
        navigationController.pushViewController(introVC, animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigationController.pushViewController(navigationVC, animated: false)
        }
        
    }
    
    func viewIntroNavVC() {
        let navigationVC = NavigationVC.instantiate()
                        
        let mainVC = MainVC.instantiate()
        let messageVC = MessageVC.instantiate()
        let notificationVC = NotificationVC.instantiate()
        let profileVC = ProfileVC.instantiate()
                
        mainVC.coordinator = self
        messageVC.coordinator = self
        notificationVC.coordinator = self
        profileVC.coordinator = self
        navigationVC.coordinator = self
        
        navigationVC.viewControllers = [mainVC, messageVC, notificationVC, profileVC]
        navigationController.pushViewController(navigationVC, animated: false)
    }
    
    func viewIntroDiagnosisVC() {
        let vc = IntroDiagnosisVC.instantiate()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        navigationController.present(vc, animated: true)
    }
    
    func viewQuestionsVC() {
        let vc = QuestionsVC.instantiate()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        navigationController.present(vc, animated: true)
    }
    
}


