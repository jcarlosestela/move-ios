//
//  Instantiable.swift
//  Move
//
//  Created by José Estela on 19/11/17.
//

import UIKit

public protocol StoryBoardInstantiable {
    static func storyboardIdentifier() -> String
    static func storyboardBundle() -> Bundle?
    static func storyboardName() -> String
}

public extension StoryBoardInstantiable where Self: UIViewController {

    static func storyboardIdentifier() -> String {
        return String(describing: self)
    }
    
    static func storyboardBundle() -> Bundle? {
        return nil
    }
    
    static func storyboardName() -> String {
        return "Main"
    }
}

public protocol XibInstantiable {
    static func xibName() -> String
    static func xibBundle() -> Bundle?
}

public extension XibInstantiable where Self: UIViewController {
    
    static func xibName() -> String {
        return String(describing: self)
    }
    
    static func xibBundle() -> Bundle? {
        return nil
    }
}
