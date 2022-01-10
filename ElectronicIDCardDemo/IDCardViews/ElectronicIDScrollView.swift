//
//  ElectronicIDScrollView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit

class ElectronicScrollView: UIScrollView, UIScrollViewDelegate {
    var views = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIScrollViewDelegate {
    
}
