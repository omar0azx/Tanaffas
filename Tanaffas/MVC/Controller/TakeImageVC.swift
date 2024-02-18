//
//  TakeImageVC.swift
//  Tanaffas
//
//  Created by omar alzhrani on 08/08/1445 AH.
//

import UIKit
import CoreML
import Vision

var temp = 0

class TakeImageVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    var ratio = 0
    var isTakenImage = false
    
    @IBOutlet weak var takeImageBTN: DesignableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if backNav {
            self.dismiss(animated: false)
        }
    }
    
    @IBAction func takeImageBTN(_ sender: UIButton) {
        if isTakenImage {
            if let questionsVC = storyboard?.instantiateViewController(identifier: "QuestionsVC") as? QuestionsVC {
                questionsVC.modalPresentationStyle = .fullScreen
                present(questionsVC, animated: true, completion: nil)
            }
        } else {
            showImageAlert()
            takeImageBTN.setTitle("إلتقط صورة لوجهك", for: .normal)
        }
    }
    
    //MARK: - Photo and image
    
    private func showImageAlert() {
        
        let alert = UIAlertController(title: "Take photo From: ", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.getPhoto(type: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true , completion: nil)
        
    }
    
    private func getPhoto(type: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            dismiss(animated: true, completion: nil)
            isTakenImage = true
            classifyImage(image: image)
            takeImageBTN.setTitle("التالي", for: .normal)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    }

}

extension TakeImageVC {
    
    func classifyImage(image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create CIImage from UIImage")
        }
        
        // Load Core ML model
        guard let model = try? VNCoreMLModel(for: ImageClassifier().model) else {
            fatalError("Failed to load Core ML model")
        }
        
        // Create a Vision request
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation], let topResult = results.first else {
                fatalError("Unexpected result type from VNCoreMLRequest")
            }
            
            // Update UI with classification result
            DispatchQueue.main.async {
                print("Classification: \(topResult.identifier) (\(topResult.confidence))")
                self!.ratio = Int((topResult.confidence * 100))
                if topResult.identifier == "Detected" {
                    print("i'm Detected")
                    temp = self!.ratio / 2
                } else {
                    print("i'm UnDetected")
                    print(100 - self!.ratio)
                    temp = 100 - self!.ratio
                }
                
            }
        }
        
        // Perform the image classification request
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([request])
        } catch {
            print("Error performing image classification request: \(error.localizedDescription)")
        }
    }
}
