//
//  PopUpMapViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 3/30/23.
//

import UIKit

class PopUpMapViewController: UIViewController {
    
    //MARK: variables
    
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var subtitletextField: UITextField!
    
     

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        moveIn()
        
        

        /*popupView.layer.cornerRadius = 16
                view.backgroundColor = UIColor.black.withAlphaComponent(0.75)

                moveIn()
         */
    }
    
    
    private func setupUI(){
        view.addSubview(titleTextField)
        view.addSubview(subtitletextField)
        view.bringSubviewToFront(titleTextField)
        view.bringSubviewToFront(subtitletextField)
        //buttons
        //shareButton.layer.cornerRadius = 10
        //saveButton.layer.cornerRadius = 10
        
        
        //customize text fields
        
        subtitletextField.layer.cornerRadius = 10
        subtitletextField.clipsToBounds = true
        subtitletextField.backgroundColor = UIColor.white
        subtitletextField.placeholder = "Comment"
        subtitletextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        subtitletextField.leftViewMode = .always
        subtitletextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        titleTextField.layer.borderColor = UIColor.gray.cgColor
        titleTextField.layer.cornerRadius = 10
        titleTextField.clipsToBounds = true
        titleTextField.backgroundColor = UIColor.white
        titleTextField.placeholder = "Title"
        titleTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        titleTextField.leftViewMode = .always
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        // button constraints
        titleTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
        titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleTextField.returnKeyType = .go
        
        subtitletextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        subtitletextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subtitletextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
        subtitletextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        subtitletextField.returnKeyType = .go
        
    }
    

    @IBAction func closeTapped(_ sender: Any) {
        moveOut()
    }
    

        func moveIn() {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.view.alpha = 0.0

            UIView.animate(withDuration: 0.24) {
                self.view.transform = CGAffineTransform.identity
                self.view.alpha = 1.0
            }
        }

        func moveOut() {
            UIView.animate(withDuration: 0.24, animations: {
                self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
                self.view.alpha = 0.0
            }) { _ in
                self.view.removeFromSuperview()
            }
        }

}
