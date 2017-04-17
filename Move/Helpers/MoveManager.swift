//
//  MoveManager.swift
//  Move
//
//  Created by José Estela on 2/3/17.
//  Copyright © 2017 José Estela. All rights reserved.
//

import Foundation
import UIKit

enum MoveInformationType {
    case initial
    case push
    case modal
}

struct MoveInformation: Equatable {
    let identifier: String
    let type: MoveInformationType
}

func == (rhs: MoveInformation, lhs: MoveInformation) -> Bool {
    return rhs.identifier == lhs.identifier
}

class MoveManager {
    
    // MARK: - Private attributes
    
    private var movesInfo: [MoveInformation] = []
    
    private weak var currentViewController: UIViewController?
    
    // MARK: - Public attributes
    
    static let shared = MoveManager()
    
    // MARK: - Public methods
    
    func setInitialViewController(viewController: UIViewController) {
        self.currentViewController = viewController
        self.movesInfo = []
        self.movesInfo.append(
            MoveInformation(
                identifier: viewController.viewControllerIdentifier(),
                type: .initial
            )
        )
        // TODO: - Remove all currents ViewControllers in RootViewController
        UIApplication.shared.delegate?.window??.rootViewController = self.currentViewController
    }
    
    func performPushNavigation(to viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let currentViewController = self.currentViewController as? UINavigationController else {
            fatalError("You must set the initial view controller as a UINagivationController")
        }
        self.movesInfo.append(
            MoveInformation(
                identifier: viewController.viewControllerIdentifier(),
                type: .push
            )
        )
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        currentViewController.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func performModalPresentation(of viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let currentViewController = self.currentViewController else {
            fatalError("You must set the initial view controller")
        }
        self.movesInfo.append(
            MoveInformation(
                identifier: viewController.viewControllerIdentifier(),
                type: .modal
            )
        )
        currentViewController.present(viewController, animated: animated, completion: completion)
    }
    
    func performBackMovement(of viewController: String, animated: Bool) {
        // TODO: Add completion block to notify when back movement finished
        guard let type = self.movesInfo.last?.type else { return }
        switch type {
        case .initial:
            fatalError("You cannot perform back movement with the initial view controller presented")
        case .push:
            self.movesInfo.removeLast(with: viewController)
            let _ = self.currentViewController?.navigationController?.popViewController(animated: animated)
        case .modal:
            self.movesInfo.removeLast(with: viewController)
            self.currentViewController?.dismiss(animated: animated, completion: nil)
        }
    }
    
    func performBackMovement(animated: Bool) {
        // TODO: Add completion block to notify when back movement finished
        guard let type = self.movesInfo.last?.type else { return }
        switch type {
        case .initial:
            fatalError("You cannot perform back movement with the initial view controller presented")
        case .push:
            self.movesInfo.removeLast()
            let _ = self.currentViewController?.navigationController?.popViewController(animated: animated)
        case .modal:
            self.movesInfo.removeLast()
            self.currentViewController?.dismiss(animated: animated, completion: nil)
        }
    }
}
