//
//  BaseView.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 19/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import UIKit
protocol BaseView: class {
    func getNavigationController() -> UINavigationController?
}

extension BaseView {
    func getNavigationController() -> UINavigationController? {
        guard let viewController = self as? UIViewController else {
            return nil
        }
        return viewController.navigationController
    }
}
