//
//  HomeTabBarVC.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class HomeTabBarVC: UITabBarController {

    
    
    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    
    
    
    
    
    // MARK: - IBOutlets
    
    
    
    
    
    
    // MARK: - Life Cycle
    
    
    init() {
        super.init(nibName: HomeTabBarVC.identifier, bundle: nil)

        loadViewIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewConfiguration()
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //This was used to increase height of tabbar
//        tabBar.frame.size.height = tabBar.frame.size.height + 20
//        tabBar.frame.origin.y = view.frame.height - tabBar.frame.size.height
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
    
    
    // MARK: - Functions
    
    
    
    func viewConfiguration() {
        
        
        if let allNewsViewController = AllNewsModule().buildDefault() as? UINavigationController, let controller = allNewsViewController.viewControllers.first as? AllNewsVC {
//            messagesController.view.backgroundColor = .cyan
            controller.shouldFetchLocal = false
            viewControllers = [allNewsViewController]
        }
        
        if let offlineNewViewController = AllNewsModule().buildDefault() as? UINavigationController , let controller = offlineNewViewController.viewControllers.first as? AllNewsVC{
            controller.shouldFetchLocal = true
            viewControllers?.append(offlineNewViewController)
        }
        
        if let firstTab = tabBar.items?[0] {
            firstTab.title = "All Stories"
        }
        if let pharmaShareTab = tabBar.items?[1] {
            pharmaShareTab.title = "Offline Stories"
        }
    }
    
    
    // MARK: - IBActions
    
    
    
    
    
    
    

}
