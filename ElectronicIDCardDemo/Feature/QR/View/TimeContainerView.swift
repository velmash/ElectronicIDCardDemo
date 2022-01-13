//
//  TimeContainerView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import SnapKit

class TimeContainerView: BaseView {
    lazy var timeSpacingView = UIView()
    lazy var timeDescriptionLabel = createLabel("남은 시간 ")
    lazy var remainTimeLabel = createLabel("")
    
    override func addSubviews() {
        addSubview(timeSpacingView)
        addSubview(timeDescriptionLabel)
        addSubview(remainTimeLabel)
        
        remainTimeLabel.textColor = .blue
    }
    
    override func addConstraints() {
        timeSpacingView.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(5)
        }

        timeDescriptionLabel.snp.remakeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.trailing.equalTo(timeSpacingView.snp.leading)
        }
        
        remainTimeLabel.snp.remakeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeSpacingView.snp.trailing)
        }
    }
}
