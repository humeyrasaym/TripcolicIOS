//
//  FirebaseManager.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 1/20/23.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    public func canCreateNewUser(email: String, username: String, completion: (Bool)-> Void){
        completion(true)
        
    }
    
    public func insertNewUser(email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email.safeDatabaseKey()).setValue(["username" : username]){error, _ in
            if error == nil {
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
        
    }
    
}
