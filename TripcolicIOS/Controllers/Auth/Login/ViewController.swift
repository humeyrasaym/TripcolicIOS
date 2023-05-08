//
//  ViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 1/4/23.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController{
    
    // MARK: - IBOutlets

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var rememberMe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTextFields()
    }
    
    
    // MARK: - functions
    
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
        
    }
    
    private func customizeTextFields(){
        passwordText.layer.cornerRadius = 18
        passwordText.layer.masksToBounds = true
        passwordText.layer.borderColor = UIColor.gray.cgColor
        passwordText.layer.borderWidth = 2
        passwordText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordText.leftViewMode = .always
        
        usernameText.layer.cornerRadius = 18
        usernameText.layer.masksToBounds = true
        usernameText.layer.borderColor = UIColor.gray.cgColor
        usernameText.layer.borderWidth = 2
        usernameText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        usernameText.leftViewMode = .always
    }
    
    // MARK: - IBActions

    @IBAction func signInButton(_ sender: Any) {
        if usernameText.text! != "" && passwordText.text! != ""{
            Auth.auth().signIn(withEmail: usernameText.text!, password: passwordText.text!){(authdata, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                }
                else {
                    self.performSegue(withIdentifier: "signInToFeed", sender: nil)
                }
            }
        }
        else{
            makeAlert(titleInput: "Error", messageInput: "Email/Password needed")
            
        }
    }
    
    @IBAction func recoveryPasswordButton(_ sender: Any) {
    }
    
    @IBAction func rememberMeButton(_ sender: Any) {
        rememberMe.isSelected.toggle()
    }
    @IBAction func registerButton(_ sender: Any) {
        // MARK: - Manual Push
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // guard let viewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        // viewController.name = "Erim"
        // self.navigationController?.pushViewController(viewController, animated: true)
        
        // MARK: - Segue
        performSegue(withIdentifier: "presentRegisterSegue", sender: nil)
    }
}

