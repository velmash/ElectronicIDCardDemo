//
//  TodayDateView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import SnapKit

class TodayDateView: BaseView {
    lazy var todayDateViewSpacing = UIView()
    lazy var todayImageView = createCompanyMark()
    lazy var todayDateLabel = createLabel("ddddd")
    
    override func addSubviews() {
        addSubview(todayDateViewSpacing)
        addSubview(todayImageView)
        addSubview(todayDateLabel)
    }
    
    override func addConstraints() {
        todayDateViewSpacing.snp.remakeConstraints {
            $0.centerX.equalToSuperview().multipliedBy(0.4)
            $0.width.equalTo(10)
            $0.top.bottom.equalToSuperview()
        }
        
        todayImageView.snp.remakeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalTo(todayDateViewSpacing.snp.leading)
            $0.width.equalTo(20)
        }
        
        todayDateLabel.snp.remakeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(todayDateViewSpacing.snp.trailing)
        }
    }
}
