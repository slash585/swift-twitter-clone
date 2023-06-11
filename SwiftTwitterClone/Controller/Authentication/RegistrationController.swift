//
//  RegistrationController.swift
//  SwiftTwitterClone
//
//  Created by Mehmet Ali Özdemir on 12.06.2023.
//

import UIKit

class RegistrationController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
    }
}
