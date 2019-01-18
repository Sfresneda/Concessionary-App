//
//  Coordinator.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var children: [Coordinator] { get set }
    
    func start()
}
