//
//  WorkCommutingView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/12.
//

import UIKit
import SnapKit

class WorkCommutingView: BaseView {
    
    lazy var title = createTitleLabel("나의 근무시간 관리")
    
    lazy var todayDateView = TodayDateView()
    lazy var commuteTime = createTitleLabel("00:00:00")
    lazy var commutingReportView = CommutingReportView()
    lazy var commuteButtonView = CommuteButtonView()
 
    override func setupSubviews() {
        super.setupSubviews()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        addToBox(title)
        addToBox(todayDateView)
        addToBox(commuteTime)
        addToBox(commutingReportView)
        addToBox(commuteButtonView)
        
        // 뷰 구분 테스트 코드
        commutingReportView.backgroundColor = .red
        commuteButtonView.backgroundColor = .red
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        title.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        
        todayDateView.snp.remakeConstraints {
            $0.centerX.equalTo(title)
            $0.top.equalTo(title.snp.bottom)
            $0.height.equalTo(20)
            $0.width.equalTo(100)
        }
        
        commuteTime.snp.remakeConstraints {
            $0.top.equalTo(todayDateView.snp.bottom).offset(25)
            $0.centerX.equalTo(title)
        }
        
        commutingReportView.snp.remakeConstraints {
            $0.centerX.equalTo(title)
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(100)
            $0.top.equalTo(commuteTime.snp.bottom).offset(40)
        }
        
        commuteButtonView.snp.remakeConstraints {
            $0.width.equalTo(commutingReportView)
            $0.centerX.equalTo(title)
            $0.height.equalTo(80)
            $0.top.equalTo(commutingReportView.snp.bottom).offset(25)
        }
    }
}
