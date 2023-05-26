//
//  ProfileViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 2/15/23.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   // MARK: IBFunctions
    
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logoutToSignIn", sender: nil)
        }catch{
            print("Error!")
                }
        
        
        
        
    }
    

}
