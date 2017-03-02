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
    
    // MARK: - Private attributes
    
    // MARK: - Public attributes
    
    // MARK: - Public methods
    
    public static func setInitialViewController(viewController: UIViewController) {
        MoveManager.shared.setInitialViewController(viewController: viewController)
    }
    
    public static func to(viewController: UIViewController, type: MoveType = .push, animated: Bool = false, completion: (() -> Void)? = nil) {
        switch type {
        case .push:
            MoveManager.shared.performPushNavigation(to: viewController, animated: animated, completion: completion)
        case .modal:
            MoveManager.shared.performModalPresentation(of: viewController, animated: animated, completion: completion)
        }
    }
}

private extension Move {
    
}
