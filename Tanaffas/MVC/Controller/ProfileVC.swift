//
//  ProfileVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import UIKit

class ProfileVC: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    var setting = [CellStructure(title: "من نحن", image: #imageLiteral(resourceName: "info")), CellStructure(title: "حذف الحساب", image: #imageLiteral(resourceName: "clear")), CellStructure(title: "الخروج من الحساب", image: #imageLiteral(resourceName: "log-out"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    func logoutAlert() {
        let logoutPopup = UIAlertController(title: "Log Out", message:
                                                "Are You Sure ?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Yes", style: .destructive ) { (buttonTapped) in

        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(cancel)
        
        
        if let popoverController = logoutPopup.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(logoutPopup, animated: true , completion: nil)
        
    }
    
    func deleteAlert() {
        let logoutPopup = UIAlertController(title: "Delete Account", message:
                                                "Are You Sure ?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Yes", style: .destructive ) { (buttonTapped) in

        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(cancel)
        
        
        if let popoverController = logoutPopup.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(logoutPopup, animated: true , completion: nil)
        
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting", for: indexPath) as! SettingCell
        cell.configar(type: setting[indexPath.row].title, image: setting[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
//            sendMessageToEmail()
            print("case0")
        case 1:
            deleteAlert()
        case 2:
            logoutAlert()
        default:
            print("error from settings in profileVC")
        }
    }
}
