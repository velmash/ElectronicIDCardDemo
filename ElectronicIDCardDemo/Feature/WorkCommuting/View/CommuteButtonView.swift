//
//  CommuteButtonView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import SnapKit

class CommuteButtonView: BaseView {
    lazy var commuteButton = createButton(name: "출근")
    lazy var leaveButton = createButton(name: "퇴근")
    
    override func addSubviews() {
        addSubview(commuteButton)
        addSubview(leaveButton)
    }
    
    override func addConstraints() {
        commuteButton.snp.remakeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        leaveButton.snp.remakeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(commuteButton.snp.trailing)
        }
    }
}
