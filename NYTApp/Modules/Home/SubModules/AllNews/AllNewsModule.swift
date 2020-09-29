//
//  AllNewsModule.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import Foundation
import UIKit


class AllNewsModule {
    func buildDefault() -> UIViewController? {
        
        
        
        let view = AllNewsVC()
        
        
        
    //        guard let view = R.storyboard.dashboard.homeViewController() else { return nil }
    //
            let interactor = AllNewsInteractorImp()
            let presenter = AllNewsPresenterImp()
            let router = AllNewsRouterImp()
            //
            view.presenter = presenter
            //
            presenter.interactor = interactor
            presenter.view = view
            presenter.router = router
            router.baseView = view
            interactor.presenter = presenter
        
        return UINavigationController.init(rootViewController: view)
//        return view
    }
}
