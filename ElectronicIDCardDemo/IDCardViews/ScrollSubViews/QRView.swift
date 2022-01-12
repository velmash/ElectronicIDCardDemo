//
//  QRView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/11.
//

import UIKit
import Combine
import SnapKit

class QRView: UIView {
    static func instance() -> QRView {
        return QRView()
    }
    
    lazy var title = createTitleLabel("출퇴근 체크 QR")
    lazy var descriptionLabel = createLabel("근태기에 QR코드를 인식해주세요.")
    lazy var qrView = createQRView(code: "TEST")
    lazy var timeContainerView = UIView()
    lazy var timeSpacingView = UIView()
    lazy var timeDescriptionLabel = createLabel("남은 시간 ")
    lazy var remainTimeLabel = createLabel("")
    lazy var progressBar = createProgressBar()
    
    lazy var restartQRButton = UIButton().then {
        $0.isHidden = true
        $0.backgroundColor = .green
        $0.alpha = 0.5
    }
    
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
        self.addSubview(descriptionLabel)
        self.addSubview(qrView)
        self.addSubview(restartQRButton)
        self.addSubview(timeContainerView)
        timeContainerView.addSubview(timeSpacingView)
        timeContainerView.addSubview(timeDescriptionLabel)
        timeContainerView.addSubview(remainTimeLabel)
        self.addSubview(progressBar)
        
        remainTimeLabel.textColor = .blue
    }
    
    private func setConstraints() {
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
        
        timeSpacingView.snp.remakeConstraints {
            $0.centerX.equalTo(title)
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

        progressBar.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(qrView.snp.width)
            $0.height.equalTo(30)
            $0.top.equalTo(timeDescriptionLabel.snp.bottom).offset(20)
        }
    }
    
    
}

