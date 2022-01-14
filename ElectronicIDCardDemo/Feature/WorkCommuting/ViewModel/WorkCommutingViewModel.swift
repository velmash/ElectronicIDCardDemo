//
//  WorkCommutingViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

class WorkCommutingViewModel: ViewModelType {
    static func instance() -> WorkCommutingViewModel {
        return WorkCommutingViewModel()
    }
    
    let workCommutingModel = WorkCommutingModel()
    
    struct Input {
        
    }
    
    final class Output {
        
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        return output
    }
}
