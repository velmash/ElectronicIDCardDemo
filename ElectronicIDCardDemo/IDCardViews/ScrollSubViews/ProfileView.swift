//
//  ProfileView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    static func instance() -> ProfileView {
        return ProfileView()
    }
    lazy var title = createTitleLabel("전자사원증")
    lazy var companyMark = createCompanyMark() 
    lazy var profilePhoto = createCompanyMark()
    lazy var department = createDepartmentLabel()
    lazy var name = createNameLabel()
    lazy var certificationLabel = createLabel("상기인을 당사 임직원임을 증명합니다.")
    
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
        self.addSubview(companyMark)
        self.addSubview(profilePhoto)
        self.addSubview(department)
        self.addSubview(name)
        self.addSubview(certificationLabel)
    }
    
    private func setConstraints() {
        title.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(40)
            $0.top.equalToSuperview().offset(25)
        }
        
        companyMark.snp.remakeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(title.snp.bottom)
        }
        
        profilePhoto.snp.remakeConstraints {
            $0.width.equalTo(companyMark.snp.width)
            $0.height.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(companyMark.snp.bottom)
        }
        
        department.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(companyMark)
            $0.top.equalTo(profilePhoto.snp.bottom).offset(10)
        }
        
        name.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(title)
            $0.top.equalTo(department.snp.bottom).offset(10)
        }
        
        certificationLabel.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(department)
            $0.top.equalTo(name.snp.bottom)
        }
    }
}
