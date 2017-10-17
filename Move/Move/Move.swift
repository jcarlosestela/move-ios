//
//  Move.swift
//  Move
//
//  Created by José Estela on 2/3/17.
//  Copyright © 2017 José Estela. All rights reserved.
//

import Foundation
import UIKit

public enum MoveType {
    case push
    case modal
}

public struct Move {
    
    // MARK: - Public methods
    
    public static func toInitial(viewController: UIViewController?) {
        MoveManager.shared.setInitialViewController(viewController)
    }
    
    public static func to(viewController: UIViewController, type: MoveType = .push, animated: Bool = false, completion: (() -> Void)? = nil) {
        switch type {
        case .push:
            MoveManager.shared.performPushNavigation(to: viewController, animated: animated, completion: completion)
        case .modal:
            MoveManager.shared.performModalPresentation(of: viewController, animated: animated, completion: completion)
        }
    }
    
    public static func back(animated: Bool) {
        MoveManager.shared.performBackMovement(animated: animated)
    }
    
    public static func back(of viewControllerIdentifier: String, animated: Bool) {
        MoveManager.shared.performBackMovement(of: viewControllerIdentifier, animated: animated)
    }
}
