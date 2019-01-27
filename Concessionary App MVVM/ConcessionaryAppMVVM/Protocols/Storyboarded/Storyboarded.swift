//
//  Storyboarded.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

protocol Storyboarded { }


extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        let storyBoardIdentifier: String = String(describing: self)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: storyBoardIdentifier, bundle: Bundle.main)
        
        return storyBoard.instantiateViewController(withIdentifier: storyBoardIdentifier) as! Self
    }
}
