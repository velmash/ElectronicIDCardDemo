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
    var timer: Timer?
    var remainTime: Double = 3
    
    private var bag = Set<AnyCancellable>()
    private let countTriggerSubject = PassthroughSubject<Void, Never>()
    private let remainTimeeSubject = PassthroughSubject<Double, Never>()
    private let countDoneSubject = PassthroughSubject<Void, Never>()
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
        
        pageControl.currentPagePublisher
            .sink { [weak self] pageNum in
                if 1 == pageNum {
                    self?.countTriggerSubject.send(())
                }
            }
            .store(in: &bag)
        
        countTriggerSubject
            .sink { self.startTimer() }
            .store(in: &bag)
        
        let calcTime = Double(self.remainTime)
        remainTimeeSubject
            .sink { [weak self] countdown in
                guard let self = self else { return }
                
                self.scrollView.qrView.remainTimeLabel.text = "\(Int(countdown) + 1)초 남음"
                
                let calcCountdonw = Double(countdown)
                self.scrollView.qrView.progressBar.progress = Float(calcCountdonw/calcTime)
                
                // 타이머 종료후 처리
                if(countdown < Double(0.0)) {
                    self.timer?.invalidate()
                    self.timer = nil
                    
                    self.countDoneSubject.send(())
                }
                
            }
            .store(in: &bag)
        
        countDoneSubject
            .sink { [weak self] _ in
                self?.scrollView.qrView.remainTimeLabel.text = "0초 남음"
                self?.scrollView.qrView.restartQRButton.isHidden = false
            }
            .store(in: &bag)
        
        self.scrollView.qrView.restartQRButton.tapPublisher
            .sink { [weak self] in
                self?.scrollView.qrView.restartQRButton.isHidden = true
                
                self?.remainTime = 3
                self?.countTriggerSubject.send(())
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

extension MainIDView {
    public func startTimer() {
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallback() {
        self.remainTimeeSubject.send(remainTime)
        remainTime -= Double(0.001)
    }
}
