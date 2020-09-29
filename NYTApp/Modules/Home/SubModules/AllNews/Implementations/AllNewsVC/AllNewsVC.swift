//
//  AllNewsVC.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class AllNewsVC: UIViewController, BaseView, AllNewsView {

    
    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    
    var presenter : AllNewsPresenterImp?
    
    var shouldFetchLocal = false
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var tableView : UITableView!
    
    
    
    // MARK: - Life Cycle
    
    
    init() {
        super.init(nibName: AllNewsVC.identifier, bundle: nil)

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
        
        if shouldFetchLocal {
            presenter?.fetchLocalNews()
        }
        else {
            presenter?.fetchNews()
        }
        
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
    
    
    // MARK: - Functions
    
    
    
    func viewConfiguration() {
        
        tableView.registerNib(from: NewsTableViewCell.self)
        
    }
    
    
    // MARK: - IBActions
    
    

}



extension AllNewsVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInTableView() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = presenter?.dataForRow(at: indexPath.row) else { return UITableViewCell() }
        guard let cell : NewsTableViewCell = tableView.dequeue(cell: NewsTableViewCell.self) else { return UITableViewCell() }
        cell.configue(with: data)
        return cell
    }
    
}



extension AllNewsVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let data = presenter?.dataForRow(at: indexPath.row) else { return }
        
        if let newsDetailsVC = NewsDetailsModule.buildDefault() as? NewsDetailsVC {
            newsDetailsVC.newsData = data
            self.navigationController?.pushViewController(newsDetailsVC, animated: true)
        }
        
        
        
    }
    
}
