//
//  AllNewsInteractor.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import Foundation

protocol AllNewsInteractor {
    var presenter: AllNewsPresenterImp? { get set }
    
    
    func fetchNews(completion : @escaping(([ApiResult]) -> Void))
    
    func fetchNewsFromJSON(completion : @escaping(([ApiResult]) -> Void))
    
}
