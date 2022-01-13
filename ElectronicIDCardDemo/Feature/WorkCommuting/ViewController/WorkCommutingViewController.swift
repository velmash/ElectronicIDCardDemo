//
//  WorkCommutingViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import Combine
import CombineCocoa

class WorkCommutingViewController: BaseViewController<WorkCommutingView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myView.todayDateView.todayDateLabel.text = getDayToday()
    }
    
    override func pageBinding() {
        myView.commuteButtonView.commuteButton.tapPublisher
            .sink { [weak self] in self?.showAlarm(.commute) }
            .store(in: &bag)
        
        myView.commuteButtonView.leaveButton.tapPublisher
            .sink { [weak self] in self?.showAlarm(.leave) }
            .store(in: &bag)
    }
}

