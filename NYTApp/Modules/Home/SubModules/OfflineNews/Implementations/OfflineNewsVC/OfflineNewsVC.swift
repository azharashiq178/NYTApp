//
//  OfflineNewsVC.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class OfflineNewsVC: UIViewController {

    
    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    
    
    
    
    
    // MARK: - IBOutlets
    
    
    
    
    
    
    // MARK: - Life Cycle
    
    
    init() {
        super.init(nibName: OfflineNewsVC.identifier, bundle: nil)

        loadViewIfNeeded()
        print("init")
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
        
        
        viewConfiguration()
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
    
    
    // MARK: - Functions
    
    
    
    func viewConfiguration() {
        
        
        
    }
    
    
    // MARK: - IBActions
    
    

}
