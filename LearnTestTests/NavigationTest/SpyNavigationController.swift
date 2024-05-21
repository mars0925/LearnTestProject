//
//  SpyNavigationController.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/21.
//

import Foundation
import UIKit
///自訂的UINavigationControllerm用來測試
class SpyNavigationController:UINavigationController{
    var pushedViewController:UIViewController!
    //複寫pushViewController 從這個方法可以知道push 哪一個pushViewController
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
    
}
