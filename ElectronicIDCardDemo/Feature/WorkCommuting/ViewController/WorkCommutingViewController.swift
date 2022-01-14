//
//  WorkCommutingViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import Combine
import CombineCocoa

class WorkCommutingViewController: BaseViewController<WorkCommutingView, WorkCommutingViewModel> {
    
    let toastViewTrigger = PassthroughSubject<Void, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.todayDateView.todayDateLabel.text = getDayToday()
    }
    
    override func pageBinding() {
        let input = WorkCommutingViewModel.Input(
            didTapCommuteButton: myView.commuteButtonView.commuteButton.tapPublisher,
            didTapLeaveButton: myView.commuteButtonView.leaveButton.tapPublisher
        )
        
        let output = viewModel.transform(input: input)
        
        output.$commute
            .filter { $0 != nil }
            .sink { [weak self] _ in self?.showAlarm(.commute) }
            .store(in: &bag)
        
        output.$leave
            .filter { $0 != nil }
            .sink { [weak self] _ in self?.showAlarm(.leave) }
            .store(in: &bag)    
    }
}

