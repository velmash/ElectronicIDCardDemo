//
//  WorkCommutingViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

import Combine

class WorkCommutingViewModel: ViewModelType {
    static func instance() -> WorkCommutingViewModel {
        return WorkCommutingViewModel()
    }
    
    let workCommutingModel = WorkCommutingModel()
    
    struct Input {
        let didTapCommuteButton: AnyPublisher<Void, Never>
        let didTapLeaveButton: AnyPublisher<Void, Never>
    }
    
    final class Output {
        @Published var commute: Void?
        @Published var leave: Void?
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.didTapCommuteButton
//            .map {
//                let 출근시간 = model.출근시간
//                let a = 출근시간 != nil ? 출근시간 : "미등록"
//                return 출근시간
//            }
            .compactMap { $0 }
            .assign(to: &output.$commute)
        
        input.didTapLeaveButton
            .compactMap { $0 }
            .assign(to: &output.$leave)
        
        return output
    }
}
