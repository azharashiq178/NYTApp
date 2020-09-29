//
//  UIViewController+Additions.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 01/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit


enum ControllerLoadType {
    case push, present
}

extension UIViewController {
    
    
    
    // MARK:- Load/Instantiate

    static func instantiate(from storyboard: UIStoryboard) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }

    
    
    
    
    // MARK:- Keyboard Editing

    func endEditing() {
        view.endEditing(true)
    }
    
    
    @objc func changeDate(with updateDate : Date) {
        
    }
    
    
    @objc func refreshData() {
        
    }
    
    // MARK:- Presentation/Dismiss
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.first!.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    fileprivate func dismissPresentedController() {
        self.dismiss(animated: true, completion: { () -> Void in
            debugPrint("\(String(describing: type(of: self))) is dismiss.")
        })
    }
    
    fileprivate func dismissPushedController() {
        _ = self.navigationController?.popViewController(animated: true)
    }

    func presentViewController(_ viewControllerToPresent: UIViewController) {
        self.presentViewController(viewControllerToPresent, animated: true)
    }
    
    func presentViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.present(viewControllerToPresent, animated: flag) { () -> Void in
            debugPrint("\(String(describing: type(of: viewControllerToPresent))) is presented.")
        }
    }
    
    func dismissViewController(_ completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    @objc func dismissMe() {
        if let navigationViewController = self.navigationController {
            
            if (navigationViewController.viewControllers.count > 1) {
                dismissPushedController()
            } else {
                dismissPresentedController()
            }
            
        } else {
            dismissPresentedController()
        }
    }

    @IBAction func dismiss(_ sender: UIButton) {
        endEditing()
        dismissMe()
    }

    func addCancelButton() {
        
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(dismissMe))
        navigationItem.leftBarButtonItem = cancelButton
    }

    
    
    
    // MARK:- NAvigation Fade Affect
    
    func fadeHideNavigation() {
        fadeNavigationBar(withAplha: 0.0)
    }

    func fadeUnHideNavigation() {
        fadeNavigationBar(withAplha: 1.0)
    }

    fileprivate func fadeNavigationBar(withAplha alpha: CGFloat) {
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        if navigationBar.alpha == alpha { return }
        
        UIView.animate(withDuration: 0.25) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.navigationController?.navigationBar.alpha = alpha
        }
    }
    
    
    
    
    
//    func assetToImageWith(asset: PHAsset) -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
//        manager.requestImage(for: asset, targetSize: CGSize(width: CGFloat.infinity, height: CGFloat.infinity), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//            thumbnail = result!
//        })
//        return thumbnail
//    }
//    // MARK:- TextField Validations
//    func validateTextField(with textField: UITextField) -> (Bool,String?) {
//        if textField.text?.count == 0 {
//            return (false,"Please enter \(textField.placeholder!)")
//        }
//        else {
//            return (true,nil)
//        }
//    }
    
}

