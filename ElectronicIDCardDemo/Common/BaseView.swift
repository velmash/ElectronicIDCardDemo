//
//  BaseView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import SnapKit

class BaseView: UIView {
    var infoBox = UIView()
    
    // MARK: - Initialization
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        infoBox.backgroundColor = .lightGray
        infoBox.alpha = 0.7
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
        addSubview(infoBox)
    }
    
    func addConstraints() {
        infoBox.snp.remakeConstraints {
            $0.top.bottom.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}

extension BaseView {
    func addToBox(_ view: UIView) {
        infoBox.addSubview(view)
    }
}
