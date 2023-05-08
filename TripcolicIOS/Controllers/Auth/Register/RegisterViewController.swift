//
//  RegisterViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 1/4/23.
//

import UIKit
import Firebase
import FirebaseAuth 

class RegisterViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTextFields()
        
        
    }
    
    //MARK: - functions
    
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
        
        emailText.layer.cornerRadius = 18
        emailText.layer.masksToBounds = true
        emailText.layer.borderColor = UIColor.gray.cgColor
        emailText.layer.borderWidth = 2
        emailText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailText.leftViewMode = .always
    }
    
    //MARK: - IBActions
    
    @IBAction func registerButton(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
                        
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!){(authdata, error) in
                
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "registerToFeed", sender: nil)
                }
            }
        }
        else{
            makeAlert(titleInput: "Error", messageInput: "Email/Password needed")
            
        }
    }
    
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }
    
}
