//
//  OfflineNewsModule.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import Foundation
import UIKit

class OfflineNewsModule {
    func buildDefault() -> UIViewController? {
        
        
        
        let view = OfflineNewsVC()
        
        
        
    //        guard let view = R.storyboard.dashboard.homeViewController() else { return nil }
    //
    //        let interactor = HomeInteractorImp()
    //        let presenter = HomePresenterImp()
    //        let router = HomeRouterImp()
    //        //
    //        view.presenter = presenter
    //        //
    //        presenter.interactor = interactor
    //        presenter.view = view
    //        presenter.router = router
    //        router.baseView = view
    //        interactor.presenter = presenter
        
        return UINavigationController.init(rootViewController: view)
//        return view
    }
}
