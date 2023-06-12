//
//  SettingsViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 5/26/23.
//

import SafariServices
import UIKit

struct SettingCellModel{
    let title:String
    let handler: (() -> Void)
}

final class SettingsViewController: UIViewController{
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    private func configureModels(){
        
        data.append([
            SettingCellModel(title: "Edit Profile") {[weak self] in
                self?.didTapEditProfile()
            },
            SettingCellModel(title: "Invite Friends") {[weak self] in
                self?.didTapInviteFriends()
            }
        ])
        
        data.append([
            SettingCellModel(title: "Terms of Service") {[weak self] in
                self?.openURL(type: .terms)
            },
        
            SettingCellModel(title: "Privacy Policy") {[weak self] in
                self?.openURL(type: .privacy)
            },
        
            SettingCellModel(title: "Help / Feedback") {[weak self] in
                self?.openURL(type: .help)
            }
        ])
        
        data.append([
            SettingCellModel(title: "Log Out") {[weak self] in
                self?.didTapLogOut()
            }])
    }
    
    enum SettingsUrlType {
        case terms, privacy, help
    }
    
    private func didTapLogOut(){
        
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure you want to log out?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                            style: .destructive,
                                            handler: { _ in
            AuthManager.shared.logOut(completion: { success in
                DispatchQueue.main.async {
                    
                    if success {
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
                        viewController.modalPresentationStyle = .fullScreen
                        self.present(viewController, animated: true){
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        } 
                        /*let loginVC = ViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true){
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }*/
                        
                    } else {
                        fatalError("Could not log you out!")
                        
                    }
                }
            })
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)

        
        
            
        }
    private func didTapEditProfile(){
        
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
    
    private func didTapInviteFriends(){
        
    }
    
    private func openURL(type: SettingsUrlType){
        let urlString: String
        
        switch type {
        case .terms: urlString = "https://help.instagram.com/581066165581870"
        case .privacy: urlString = "https://help.instagram.com/155833707900388"
        case .help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {return}
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    
    
        
    }

    
    
    extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int{
            return data.count
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return data[section].count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = data[indexPath.section][indexPath.row].title
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            data[indexPath.section][indexPath.row].handler()
        }
        
        
        
        
    }
    
    

