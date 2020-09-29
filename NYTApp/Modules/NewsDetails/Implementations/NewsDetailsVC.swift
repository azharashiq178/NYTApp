//
//  NewsDetailsVC.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class NewsDetailsVC: UIViewController, BaseView {
    
    
    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    
//    var presenter : AllNewsPresenterImp?
    
    var newsData : ApiResult?
    
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var newsImageView : UIImageView!
    @IBOutlet weak var newsTitleLabel : UILabel!
    @IBOutlet weak var newsDetailLabel : UILabel!
    
    
    
    // MARK: - Life Cycle
    
    
    init() {
        super.init(nibName: NewsDetailsVC.identifier, bundle: nil)

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let urlStr = newsData?.multimedia?[1].url {
            newsImageView.imageFromServerURL(urlString: urlStr, PlaceHolderImage: UIImage())
        }
        
        newsTitleLabel.text = newsData?.title
        newsDetailLabel.text = newsData?.abstract
        
        
        
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
    

    
    @IBAction func showNewsAction(_ sender : UIButton) {
        if let newsURLStr = newsData?.url, let newsURL = URL.init(string: newsURLStr) {
            
            let webViewController = NewsWebViewController()
            webViewController.urlToOpen = newsURL
            self.navigationController?.pushViewController(webViewController, animated: true)
            
//            UIApplication.shared.open(newsURL, options: [:], completionHandler: nil)
        }
    }
    

}
