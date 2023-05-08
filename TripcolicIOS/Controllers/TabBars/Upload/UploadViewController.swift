//
//  UploadViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 5/8/23.
//

import Foundation
import UIKit


class UploadViewController: UIViewController{
    
       
    @IBOutlet weak var imageLibrary: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTextFields()
    }
    
    private func customizeTextFields(){
        commentText.layer.cornerRadius = 18
        commentText.layer.masksToBounds = true
        commentText.layer.borderColor = UIColor.gray.cgColor
        commentText.layer.borderWidth = 2
        commentText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        commentText.leftViewMode = .always
    }
    @IBAction func uploadButtonClicked(_ sender: Any) {
    }
}
