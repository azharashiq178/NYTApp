//
//  NewsWebViewController.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit
import WebKit

class NewsWebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    
    var urlToOpen : URL!
    
    
    
    init() {
        super.init(nibName: NewsWebViewController.identifier, bundle: nil)

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
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webView.load(URLRequest(url: urlToOpen))
        webView.allowsBackForwardNavigationGestures = true
    }

    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
