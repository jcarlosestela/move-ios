//
//  MoveManager.swift
//  Move
//
//  Created by José Estela on 2/3/17.
//  Copyright © 2017 José Estela. All rights reserved.
//

import Foundation
import UIKit

class MoveManager {
    
    // MARK: - Private attributes
    
    
    // MARK: - Public attributes
    
    static let shared = MoveManager()
    
    weak var currentViewController: UIViewController?
    
    // MARK: - Public methods
    
    func setInitialViewController(viewController: UIViewController) {
        self.currentViewController = viewController
        UIApplication.shared.delegate?.window??.rootViewController = self.currentViewController
    }
    
    func performPushNavigation(to viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let currentViewController = self.currentViewController as? UINavigationController else {
            fatalError("You must set the initial view controller as a UINagivationController")
        }
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        currentViewController.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func performModalPresentation(of viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let currentViewController = self.currentViewController else {
            fatalError("You must set the initial view controller")
        }
        currentViewController.present(viewController, animated: animated, completion: completion)
    }
}
