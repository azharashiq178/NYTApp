//
//  AllNewsPresenterImp.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class AllNewsPresenterImp: AllNewsPresenter {
    
    var view: AllNewsVC?
    
    var interactor: AllNewsInteractorImp?
    
    var router: AllNewsRouterImp?
    
    
    
    var newsList : [ApiResult]?
    
    func fetchNews() {
        
        interactor?.fetchNews(completion: { [weak self](newsResponse) in
            self?.newsList = newsResponse
            self?.view?.tableView.reloadData()
        })
        
    }
    
    
    func fetchLocalNews() {
        
        interactor?.fetchNewsFromJSON(completion: { [weak self](newsResponse) in
            self?.newsList = newsResponse
            self?.view?.tableView.reloadData()
        })
        
        
    }
    
    
    func numberOfRowsInTableView() -> Int {
        return newsList?.count ?? 0
    }
    
    
    func dataForRow(at index : Int) -> ApiResult? {
        
        return newsList?[index]
        
    }
    
    
}
