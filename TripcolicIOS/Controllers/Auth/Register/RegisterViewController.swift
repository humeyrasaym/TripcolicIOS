//
//  RegisterViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 1/4/23.
//

import UIKit
import Firebase
import FirebaseAuth
import SafariServices

class RegisterViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        view.addSubview(termsButton)
        view.addSubview(privacyButton)

        
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
        
        termsButton.frame = CGRect(x: 75,
                                   y: view.height-view.safeAreaInsets.bottom-100,
                                   width:view.width-20,
                                   height: 50)
        
        privacyButton.frame = CGRect(x: -75,
                                   y: view.height-view.safeAreaInsets.bottom-100,
                                   width:view.width-20,
                                   height: 50)
    
    }
    
    
    
    @objc private func didTapTermsButton(){
        guard let url = URL(string: "https://help.instagram.com/581066165581870?__coig_restricted=1") else{return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    @objc private func didTapPrivacyButton(){
        guard let url = URL(string: "https://privacycenter.instagram.com/policy") else{return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    //MARK: - IBActions
    
    @IBAction func registerButton(_ sender: Any) {
        
        emailText.resignFirstResponder()
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
        
        guard let email = emailText.text, !email.isEmpty,
              let username = usernameText.text, !username.isEmpty,
              let password = passwordText.text, !password.isEmpty else{return}
        
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password){ registered in
            DispatchQueue.main.async{
                if registered{
                    
                    self.performSegue(withIdentifier: "registerToFeed", sender: nil)
                    
                }
                else {
                    
                }
            }
            
        }
    
        
        /*if emailText.text != "" && passwordText.text != "" {
                        
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
            
        }*/
    }
    
    //MARK: -Segue
    @IBAction func signInButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }
    
}
