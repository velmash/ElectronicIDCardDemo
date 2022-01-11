//
//  QRView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/11.
//

import UIKit
import SnapKit

class QRView: UIView {
    lazy var title = createTitleLabel("출퇴근 체크 QR")
    lazy var descriptionLabel = createLabel("근태기에 QR코드를 인식해주세요.")
    lazy var qrView = createQRView(code: "TEST")
    lazy var timeDescriptionLabel = createLabel("남은 시간@@@@@@@@@@@@@@@")
    lazy var progressBar = createProgressBar()
    
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
        self.addSubview(timeDescriptionLabel)
        self.addSubview(progressBar)
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

        timeDescriptionLabel.snp.remakeConstraints {
            $0.centerX.equalTo(title)
            $0.top.equalTo(qrView.snp.bottom).offset(20)
        }

        progressBar.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(qrView.snp.width)
            $0.top.equalTo(timeDescriptionLabel.snp.bottom).offset(20)
        }
    }
    
    private func createProgressBar() -> UIProgressView {
        return UIProgressView().then {
            $0.progressViewStyle = .default
        }
    }
}

