//
//  IDView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import SnapKit
import Then

class MainIDView: UIView {
    lazy var backButton = createBackButtion()
//    lazy var scrollView: HorizontalScrollView = {
//        let view = HorizontalScrollView()
//
//        return view
//    }()
    lazy var scrollView = HorizontalScrollView.instance()
    
    lazy var pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        pageControl.numberOfPages = scrollView.dataSource?.count ?? 0
        print("SDHIFS", scrollView.dataSource?.count)
        insertDataSource()
        
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        self.addSubview(scrollView)
        self.addSubview(backButton)
        self.addSubview(pageControl)
    }
    
    func setConstraints() {
        self.scrollView.snp.remakeConstraints {
            $0.width.equalTo(Constants.MainIDViewDesign.cardWidth)
            $0.height.equalTo(Constants.MainIDViewDesign.cardHeight
            )
            $0.center.equalToSuperview()
        }
        
        self.backButton.snp.remakeConstraints {
            $0.size.equalTo(Constants.MainIDViewDesign.backButtonSize)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
        
        self.pageControl.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(scrollView.snp.bottom)
        }
        
//        self.profileView.snp.remakeConstraints {
//            $0.edges.equalToSuperview()
//        }
        
//        self.qrView.snp.remakeConstraints {
//            $0.edges.equalToSuperview()
//        }
    }
    
    private func insertDataSource() {
        scrollView.dataSource = Mocks.getDataSource()
    }
}

extension MainIDView {
    private func createBackButtion() -> UIButton {
        return UIButton().then {
            $0.setTitle("X", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .yellow
            $0.addTarget(self, action: #selector(removeIDCardView), for: .touchUpInside)
        }
    }
    
    @objc func removeIDCardView() {
        self.removeFromSuperview()
    }
}
