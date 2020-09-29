//
//  UITableView+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 18/01/2018.
//  Copyright © 2018 FahidAttique. All rights reserved.
//

import Foundation
import UIKit

//protocol AAPullToRefreshProtocol {
//    func insertPullToRefresh()
//}

extension UITableView {
    
    func registerNib(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }

    func registerNib(from headerFooterClass: UITableViewHeaderFooterView.Type) {
        let identifier = headerFooterClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    
    
    @objc  func registerCell(from cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeue<T: Any>(cell: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }

    func dequeue<T: Any>(headerFooter: UITableViewHeaderFooterView.Type) -> T? {
        
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooter.identifier) as? T
    }
    
    func reloadTableWithoutScrolling() {
        
        let contentOffset = self.contentOffset
        self.reloadData()
        self.layoutIfNeeded()
        self.setContentOffset(contentOffset, animated: false)
    }

//    func addRefreshControl(viewcontroller:UIViewController, delegate : RefreshIndicatorProtocol? = nil)
//    {
//        self.refreshControl = UIRefreshControl()
//        let myImageView = UIImageView.init(image: UIImage.init(named: "logo"))
//        myImageView.frame = CGRect.init(x: (viewcontroller.view.frame.width / 2) - 20, y: 10, width: 40, height: 40)
//        
//        let animation = CABasicAnimation(keyPath: "transform.rotation")
//        animation.fromValue = 0
//        animation.toValue =  Double.pi * 2.0
//        animation.duration = 2
//        animation.repeatCount = .infinity
//        animation.isRemovedOnCompletion = true
//        
//        myImageView.layer.add(animation, forKey: "spin")
//        self.refreshControl?.tintColor = UIColor.clear
//        self.refreshControl?.addSubview(myImageView)
////        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
//        
//        self.refreshControl?.addTarget(viewcontroller, action: #selector(viewcontroller.refreshData), for: .valueChanged)
//        
//        self.refreshControl?.addTarget(viewcontroller, action: #selector(self.startRefreshControl), for: .valueChanged)
//        
//        
//        refreshControl?.backgroundColor = .red
//        self.addSubview(refreshControl!)
//    }
    
    func stopRefreshControl() {
        for view in self.refreshControl!.subviews {
            view.isHidden = true
        }
        self.refreshControl?.endRefreshing()
    }
    
    @objc func startRefreshControl() {
        
        for view in self.refreshControl!.subviews {
            view.isHidden = false
        }
        self.refreshControl?.beginRefreshing()
    }
    
}






extension UITableView {
    
    func addRefreshControl(_ refresher: UIRefreshControl, withSelector selector:Selector) {
        
        refresher.addTarget(nil, action: selector, for: .valueChanged)
        if #available(iOS 10.0, *) {
            refreshControl = refresher
        } else {
            addSubview(refresher)
        }
    }
    
}





extension UITableView {
    
    func setEstimatedRowHeight(with estimatedRowHeight : CGFloat = 44) {
        self.estimatedRowHeight = estimatedRowHeight
        self.rowHeight = UITableView.automaticDimension
    }
    
    
}
