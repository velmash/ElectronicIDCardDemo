//
//  UIView+Extension.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import Then

extension UIView {
    func createTitleLabel(_ sentence: String) -> UILabel {
        return UILabel().then {
            $0.text = sentence
            $0.font = .systemFont(ofSize: 30, weight: .bold)
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.lineBreakMode = .byWordWrapping
        }
    }
    
    func createLabel(_ sentence: String = "") -> UILabel {
        return createTitleLabel(sentence).then {
            $0.font = .systemFont(ofSize: 10, weight: .medium)
        }
    }
    
    func createCompanyMark() -> UIImageView {
        // 서버에서 사진 받아오는 데이터로 return
        // 현재는 임시
        return UIImageView().then {
            $0.image = UIImage(named: "Ggachi")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    func createDepartmentLabel() -> UILabel {
        // 서버에서 받아오는 데이터로 return
        // 현재는 임시
        return createLabel("더존비즈온 / 모바일Cell")
    }
    
    func createNameLabel() -> UILabel {
        // 서버에서 받아오는 데이터로 return
        // 현재는 임시
        return createTitleLabel("방유라")
    }
    
    func createProgressBar() -> UIProgressView {
        return UIProgressView().then {
            $0.progressViewStyle = .default
        }
    }
    
    func createQRView(code: String) -> UIView {
        let qrView = QRCodeView()
        qrView.generateCode(code)
        return qrView
    }
    
    func createStackView() -> UIStackView {
        return UIStackView().then {
            $0.alignment = .fill
            $0.axis = .horizontal
            $0.backgroundColor = .orange
        }
    }
    
    func createButton(name: String) -> UIButton {
        return UIButton().then {
            $0.setTitle(name, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .blue
        }
    }
}
