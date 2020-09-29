//
//  AllNewsInteractorImp.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class AllNewsInteractorImp: AllNewsInteractor {
    
    
    
    var presenter: AllNewsPresenterImp?
    

    
    func fetchNews(completion: @escaping (([ApiResult]) -> Void)) {
        
        let apiService : ApiClient = ApiClientImpl()

        apiService.fetchNews { (result) in
            
            switch result {
            case .success(let newsData, _):
                completion(newsData.results ?? [ApiResult]())
                break
            case .failure(let error, _):
                completion([ApiResult]())
                break
            
            }
            
        }
        
    }
    
    func fetchNewsFromJSON(completion: @escaping (([ApiResult]) -> Void)) {
        
        if let path = Bundle.main.path(forResource: "TopStories", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                // do stuff
                
                let decoder = JSONDecoder()
                let news = try? decoder.decode(NewsData.self, from: data)
                
                completion(news?.results ?? [ApiResult]())
                
                
            } catch {
                // handle error
                completion([ApiResult]())
            }
        }
        
    }
    
    
}





