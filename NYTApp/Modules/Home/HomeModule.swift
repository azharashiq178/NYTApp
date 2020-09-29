//
//  HomeModule.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import Foundation
import UIKit

class HomeModule {
    
    static func buildDefault() -> UIViewController? {
        
        
        
        let view = HomeTabBarVC()
        
        
        
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
        
        
        return view
    }
    
}




