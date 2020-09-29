//
//  AllNewsPresenter.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import Foundation

protocol AllNewsPresenter {
    
    var view: AllNewsVC? { get set }
    var interactor: AllNewsInteractorImp? { get set }
    var router: AllNewsRouterImp? { get set }
    
    
    
    func fetchNews()
}
