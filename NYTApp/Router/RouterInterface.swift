//
//  RouterInterface.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 19/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import UIKit
enum Transition {
    case root
    case show
    case modally(fromViewController: UIViewController)
}

protocol RouterInterface: class {
    var baseView: BaseView? {get set}
    
    func popFromNavigationController(animated: Bool)
    func popNavigationControllerToRoot(animated: Bool)
   // func popNavigationControllerToViewController(className: String)
    func dismiss(animated: Bool)
}

extension RouterInterface {
    
    private func getNavigationController() -> UINavigationController? {
        return baseView?.getNavigationController()
    }
    
    func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
        switch transition {
        case .show:
            guard let navigationController = getNavigationController() else { return }
            navigationController.pushViewController(viewController, animated: animated)
        case .modally(let fromViewController):            
            viewController.modalPresentationStyle = .overCurrentContext
            fromViewController.present(viewController, animated: true, completion: nil)
        case .root:
            guard let navigationController = getNavigationController() else { return }
            navigationController.setViewControllers([viewController], animated: animated)
        }
    }
    
    func popFromNavigationController(animated: Bool = true) {
        getNavigationController()?.popViewController(animated: animated)
    }

    func popNavigationControllerToRoot(animated: Bool=true) {
        getNavigationController()?.popToRootViewController(animated: animated)
    }
    
//    func popNavigationControllerToViewController(className: String) {
//        guard let navigationController = navigationController else { return }
//
//        for viewController in navigationController.viewControllers
//            where String(describing: type(of: viewController)) == className {
//            navigationController.popToViewController(viewController, animated: true)
//        }
//    }
    
    func dismiss(animated: Bool) {
        getNavigationController()?.dismiss(animated: animated)
    }
}
