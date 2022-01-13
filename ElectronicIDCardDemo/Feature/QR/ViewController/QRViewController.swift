//
//  QRViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import Combine

class QRViewController: BaseViewController<QRView> {
    
    //MARK: properties
    private var timer: Timer?
    private var remainTime: Double = 3
    private var roopCount = 3
    
    //MARK: Subjects
    private let countTriggerSubject = CurrentValueSubject<Void, Never>(())
    private let remainTimeSubject = PassthroughSubject<Double, Never>()
    private let countDoneSubject = PassthroughSubject<Void, Never>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial trigger
        countTriggerSubject.send(())
    }
    
    override func pageBinding() {
        // start timer after trriger
        countTriggerSubject
            // 여기에 qr 새로만드는 로직도 추가
            // 여기또는 타이머에 또는 새로운 Subject에 반응형으로
//        myView.qrView.createQRView(code: 여기에 함수화 된 뭐 코드 ---),,,, 방법 여러가지
            .sink { self.startTimer() }
            .store(in: &bag)
        
        // binding label & progress bar
        let calcTime = Double(self.remainTime)
        remainTimeSubject
            .sink { [weak self] countdown in
                guard let self = self else { return }
                
                self.myView.timeContainerView.remainTimeLabel.text = "\(Int(countdown) + 1)초 남음"
                let calcCountdown = Double(countdown)
                self.myView.progressBar.progress = Float(calcCountdown / calcTime)
                
                if(countdown < Double(0.0)) {
                    self.timer?.invalidate()
                    self.timer = nil
                    
                    self.roopCount -= 1
                    self.countDoneSubject.send(())
                }
            }
            .store(in: &bag)
        
        // loop 3 times
        countDoneSubject
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.myView.timeContainerView.remainTimeLabel.text = "0초 남음"
                self.remainTime = 3
                self.countTriggerSubject.send(())

                if self.roopCount == 0 {
                    self.myView.restartQRButton.isHidden = false
                    
                    self.timer?.invalidate()
                    self.timer = nil
                }
            }
            .store(in: &bag)
        
        // bind button
        myView.restartQRButton.tapPublisher
            .sink { [weak self] in
                guard let self = self else { return }
                self.myView.restartQRButton.isHidden = true
                
                self.remainTime = 3
                self.roopCount = 3
                self.countTriggerSubject.send(())
            }
            .store(in: &bag)
    }
}

extension QRViewController {
    public func startTimer() {
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func timerCallback() {
        self.remainTimeSubject.send(remainTime)
        remainTime -= Double(0.001)
    }
}
