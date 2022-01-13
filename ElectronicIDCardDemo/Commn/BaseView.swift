//
//  BaseView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit

class BaseView: UIView {
    // MARK: - Initialization
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    func setupSubviews() {
        createViews()
        addSubviews()
        addConstraints()
    }
    
    func createViews() {
        
    }
    
    func addSubviews() {
        
    }
    
    func addConstraints() {
        
    }
}
