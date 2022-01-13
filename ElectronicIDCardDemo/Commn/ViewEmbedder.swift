//
//  ViewEmbedder.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit

class ViewEmbedder {
    class func embed(parent: UIViewController,
                    container: UIView,
                     child: UIViewController,
                     previous: UIViewController?) {
        if let previous = previous {
            removeFromParent(viewController: previous)
        }
        
        child.willMove(toParent: parent)
        parent.addChild(child)
        
        child.view.frame = CGRect(x: 0,
                                  y: 0,
                                  width: container.frame.size.width,
                                  height: container.frame.size.height)
        container.addSubview(child.view)
        child.didMove(toParent: parent)
    }

    class func removeFromParent(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
