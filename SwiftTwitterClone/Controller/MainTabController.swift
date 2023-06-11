//
//  MainTabController.swift
//  SwiftTwitterClone
//
//  Created by Mehmet Ali Özdemir on 12.06.2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
    }
    
    //MARK: - Helpers
    
    func configureViewControllers(){
        
        let feed = FeedController()
        let explore = ExploreController()
        let notifications = NotificationsController()
        let conversation = ConversationsController()
        
        viewControllers = [feed, explore, notifications, conversation]
    }
    

}
