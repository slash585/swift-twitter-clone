//
//  File.swift
//  SwiftTwitterClone
//
//  Created by Mehmet Ali Özdemir on 18.06.2023.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let username: String
    let fullname: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void){
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData( imageData, metadata: nil ) { (meta, error) in
            storageRef.downloadURL{ (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                    if let error = error {
                        print("DEBUG: Error: \(error.localizedDescription)")
                        return
                    }
                    
                    print("DEBUG: Succesfully registered user. ")
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let values = ["email": credentials.email, "username": credentials.username, "fullname": credentials.fullname, "profileImageUrl": profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values)
                }
                
            }
        }
    }
    
    func logUserIn(withEmail email: String, password: String, handler: @escaping (AuthDataResult?, Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
}
