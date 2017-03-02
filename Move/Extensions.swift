//
//  Extensions.swift
//  Move
//
//  Created by José Estela on 2/3/17.
//  Copyright © 2017 José Estela. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    static func fromStoryBoard<T>(type: T.Type) -> T {
        return fromStoryBoard(storyBoard: "Main", type: type)
    }
    
    static func fromStoryBoard<T>(storyBoard: String, type: T.Type, bundle: Bundle? = nil, identifier: String? = nil) -> T {
        guard let identifier = identifier else {
            return UIStoryboard(name: storyBoard, bundle: bundle).instantiateViewController(withIdentifier: String(describing: type)) as! T
        }
        return UIStoryboard(name: storyBoard, bundle: bundle).instantiateViewController(withIdentifier: identifier) as! T
    }
}
