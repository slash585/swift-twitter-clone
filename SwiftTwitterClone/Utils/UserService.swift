//
//  UserService.swift
//  SwiftTwitterClone
//
//  Created by Mehmet Ali Özdemir on 19.06.2023.
//

import Foundation
import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            
            print("DEBUG: user name: \(user.username)")
        }
    }
}


