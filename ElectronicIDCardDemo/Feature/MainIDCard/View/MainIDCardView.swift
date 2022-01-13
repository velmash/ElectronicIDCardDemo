//
//  MainIDCardView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import Then

class MainIDCardView: BaseView {
    
    lazy var backButton = createButton(name: "X").then {
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .yellow
    }
    
    lazy var pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = UIColor.white
        $0.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.36)
    }
    
    var pageContainerView = UIView().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    }
    
    override func addSubviews() {
        addSubview(backButton)
        addSubview(pageContainerView)
        addSubview(pageControl)
    }
    
    override func addConstraints() {
        pageContainerView.snp.makeConstraints {
            $0.width.equalToSuperview()//(Constants.MainIDViewDesign.cardWidth)
            $0.height.equalTo(Constants.MainIDViewDesign.cardHeight)
            $0.center.equalToSuperview()
        }
        
        self.backButton.snp.remakeConstraints {
            $0.size.equalTo(Constants.MainIDViewDesign.backButtonSize)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
        
        self.pageControl.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pageContainerView.snp.bottom)
        }
    }
}
