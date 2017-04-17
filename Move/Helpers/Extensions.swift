//
//  Extensions.swift
//  Move
//
//  Created by José Estela on 2/3/17.
//  Copyright © 2017 José Estela. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIViewController

public extension UIViewController {
   
    // MARK: - Public methods
    
    func viewControllerIdentifier() -> String {
        return String(describing: self)
    }
    
    // MARK: - Static methods
    
    static func fromXib<T>() -> T {
        // TODO: Check this method
        return fromXib(name: String(describing: T.self))
    }
    
    static func fromXib<T>(name: String, bundle: Bundle? = nil) -> T {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: T.self, options: nil).first as! T
    }
    
    static func fromStoryBoard<T>() -> T {
        return fromStoryBoard("Main")
    }
    
    static func fromStoryBoard<T>(_ storyboard: String, bundle: Bundle? = nil, identifier: String? = nil) -> T {
        guard let identifier = identifier else {
            return UIStoryboard(name: storyboard, bundle: bundle).instantiateViewController(withIdentifier: String(describing: self)) as! T
        }
        return UIStoryboard(name: storyboard, bundle: bundle).instantiateViewController(withIdentifier: identifier) as! T
    }
}

// MARK: - Array

extension RangeReplaceableCollection where Iterator.Element == MoveInformation {
    
    mutating func removeLast(with identifier: String) {
        let allWithIndentifier = self.filter({
            $0.identifier == identifier
        })
        guard let last = allWithIndentifier.last else {
            return
        }
        self.removeObject(object: last)
    }
    
    mutating func removeObject(object : Generator.Element) {
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
}
