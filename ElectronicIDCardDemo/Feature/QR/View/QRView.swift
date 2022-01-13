//
//  QRView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/11.
//

import UIKit
import Combine
import SnapKit

class QRView: BaseView {
    lazy var title = createTitleLabel("출퇴근 체크 QR")
    lazy var descriptionLabel = createLabel("근태기에 QR코드를 인식해주세요.")
    lazy var qrView = createQRView(code: "TEST")
    lazy var timeContainerView = TimeContainerView()
    
    lazy var progressBar = createProgressBar()
    
    lazy var restartQRButton = UIButton().then {
        $0.isHidden = true
        $0.backgroundColor = .green
        $0.alpha = 0.5
    }
    
    override func setupSubviews() {
        super.setupSubviews()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        addToBox(title)
        addToBox(descriptionLabel)
        addToBox(qrView)
        addToBox(restartQRButton)
        addToBox(timeContainerView)
        addToBox(progressBar)
        
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        title.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(40)
            $0.top.equalToSuperview().offset(25)
        }
        
        descriptionLabel.snp.remakeConstraints {
            $0.centerX.equalTo(title)
            $0.top.equalTo(title.snp.bottom).offset(30)
        }

        qrView.snp.remakeConstraints {
            $0.size.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
        }
        
        restartQRButton.snp.remakeConstraints {
            $0.edges.equalTo(qrView)
        }
        
        timeContainerView.snp.remakeConstraints {
            $0.centerX.equalTo(title)
            $0.top.equalTo(qrView.snp.bottom).offset(20)
        }
        
        

        progressBar.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(qrView.snp.width)
            $0.height.equalTo(30)
            $0.top.equalTo(timeContainerView.snp.bottom).offset(20)
        }
    }
    
    
}

