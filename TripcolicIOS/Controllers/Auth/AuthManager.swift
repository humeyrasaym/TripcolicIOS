//
//  AuthManager.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 5/18/23.
//

import FirebaseAuth

public class AuthManager{
    
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool)->Void){
        
        DatabaseManager.shared.canCreateNewUser(email: email, username: username){ canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    //insert db
                    DatabaseManager.shared.insertNewUser(email: email, username: username){inserted in
                        if inserted{
                            completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                        
                    }
                }
            }
            else{
                completion(false)
            }
        }
        
        
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        
        if let email = email{
            //email login
            Auth.auth().signIn(withEmail: email, password: password){
                authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
            
        } else if let username = username{
            //username login
            print(username)
        }
        
        
    }
    
    public func logOut(completion: (Bool) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch{
            print(error)
            completion(false)
            return
        }
    }
}
