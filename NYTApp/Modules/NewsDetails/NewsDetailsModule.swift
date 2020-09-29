//
//  NewsDetailsModule.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import Foundation
import UIKit


class NewsDetailsModule {
    
    static func buildDefault() -> UIViewController? {
        
        
        
        let view = NewsDetailsVC()
        
        
        
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
