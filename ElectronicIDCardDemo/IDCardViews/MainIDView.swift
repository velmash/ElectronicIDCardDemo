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
    var scrollView = ElectronicScrollView()
    lazy var pageControl = UIPageControl()
    
    var profileView = ProfileView()
    var qrView = QRView()
//    var views = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        views = [profileView, profileView, profileView]
        
        setView()
        
//        test()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    func test() {
//        scrollView.backgroundColor = .blue
//        scrollView.isPagingEnabled = true
//
//        let numberOfPages :Int = 2
//        let padding : CGFloat = 15
//        let viewWidth = self.frame.size.width - 2 * padding
//        let viewHeight = self.frame.size.height - 2 * padding
//
//        var x : CGFloat = 0
//
//        for i in 0...numberOfPages{
//            var view: UIView = UIView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight))
//            view = views[i]
//            scrollView .addSubview(view)
//            x = view.frame.origin.x + viewWidth + padding
//        }
//
//        scrollView.contentSize = CGSize(width:x+padding, height:scrollView.frame.size.height)
//    }
    
    func setView() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        pageControl.numberOfPages = 3
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        self.addSubview(scrollView)
        self.addSubview(backButton)
        self.addSubview(pageControl)
//        scrollView.addSubview(profileView)
        scrollView.addSubview(qrView)
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
        
        self.qrView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
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
