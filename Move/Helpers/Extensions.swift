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

extension UIViewController {
   
    // MARK: - Public methods
    
    func viewControllerIdentifier() -> String {
        return String(describing: self)
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
    
    mutating func removeObject(object : Iterator.Element) {
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
}
