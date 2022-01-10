//
//  UIView+Extension.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit

extension UIView {
    func createTitleLabel(_ sentence: String) -> UILabel {
        return UILabel().then {
            $0.text = sentence
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.numberOfLines = 0
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
            $0.image = UIImage(named: "swift-og")
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
}
