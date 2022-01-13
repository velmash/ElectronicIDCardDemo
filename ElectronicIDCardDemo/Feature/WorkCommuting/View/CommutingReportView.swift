//
//  CommutingReportView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import SnapKit

class CommutingReportView: BaseView {
    lazy var onTime = createLabel("출근시간")
    lazy var onTimeDetail = createLabel("미등록")
    lazy var offTime = createLabel("퇴근시간")
    lazy var offTimeDetail = createLabel("미등록")
    
    override func addSubviews() {
        addSubview(onTime)
        addSubview(onTimeDetail)
        addSubview(offTime)
        addSubview(offTimeDetail)
    }
    
    override func addConstraints() {
        onTime.snp.remakeConstraints {
            $0.leading.top.equalToSuperview().offset(20)
        }
        
        onTimeDetail.snp.remakeConstraints {
            $0.leading.equalTo(onTime)
            $0.top.equalTo(onTime.snp.bottom).offset(10)
        }
        
        offTime.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        offTimeDetail.snp.remakeConstraints {
            $0.trailing.equalTo(offTime)
            $0.top.equalTo(offTime.snp.bottom).offset(10)
        }
    }
}
