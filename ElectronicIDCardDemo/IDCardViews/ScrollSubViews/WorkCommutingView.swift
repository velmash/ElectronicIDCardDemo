//
//  WorkCommutingView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/12.
//

import UIKit
import SnapKit

class WorkCommutingView: UIView {
    static func instance() -> WorkCommutingView {
        return WorkCommutingView()
    }
    
    lazy var title = createTitleLabel("나의 근무시간 관리")
    
    lazy var todayDateView = UIView()
    lazy var todayDateViewSpacing = UIView()
    lazy var todayImageView = createCompanyMark()
    lazy var todayDateLabel = createLabel("ddddd")
    
    lazy var earlyCommuteTime = createTitleLabel("00:00:00")
    
    lazy var commutingReportView = UIView()
    lazy var onTime = createLabel("출근시간")
    lazy var onTimeDetail = createLabel("미등록")
    lazy var offTime = createLabel("퇴근시간")
    lazy var offTimeDetail = createLabel("미등록")
    
    lazy var commuteButton = createButton(name: "출근")
    lazy var leaveButton = createButton(name: "퇴근")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(title)
        self.addSubview(todayDateView)
        todayDateView.addSubview(todayDateViewSpacing)
        todayDateView.addSubview(todayImageView)
        todayDateView.addSubview(todayDateLabel)
    }
    
    private func setConstraints() {
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
