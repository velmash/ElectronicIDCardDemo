//
//  IDView.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/10.
//

import UIKit
import Combine
import CombineCocoa
import SnapKit
import Then

class MainIDView: UIView {
    private var bag = Set<AnyCancellable>()
    private let triggerSubject = PassthroughSubject<Void, Never>()
    private var pageControlFlag: CGFloat = 1
    
    lazy var backButton = createBackButtion()
    lazy var scrollView = ElectronicIDScrollView.instance()
    lazy var pageControl = UIPageControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        pageBinding()
        scrollView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pageBinding() {
        // PageControl
        scrollView.pageCount
            .sink { [weak self] count in
                self?.pageControl.numberOfPages = count ?? 0
            }
            .store(in: &bag)
        
        
        // 수정중
        pageControl.currentPagePublisher
            .sink { [weak self] pageNum in
                if 1 == pageNum {
                    self?.triggerSubject.send(())
                }
            }
            .store(in: &bag)
        
        triggerSubject
            .sink {
                let timer = Timer
                    .publish(every: 1.0, on: .main, in: .common)
                    .autoconnect()

                var counter = 0
                let subscriber = timer
                    .map({ (date) -> Void in
                        counter += 1
                    })
                    .sink { _ in

                        print("I am printing the counter \(counter)")
                        if counter >= 5 {
                            print("greater than 5")
                            timer.upstream.connect().cancel()

                        }
                    }
            }
            .store(in: &bag)
        
        
    }
    
    func setView() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
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
    }
}

extension MainIDView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if pageControlFlag < scrollView.contentOffset.x {
            pageControl.currentPage += 1
        } else {
            pageControl.currentPage -= 1
        }
        pageControlFlag = scrollView.contentOffset.x
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
