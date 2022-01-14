//
//  MainIDCardViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

class MainIDCardViewModel: ViewModelType {
    static func instance() -> MainIDCardViewModel {
        return MainIDCardViewModel()
    }
    
    let mainModel = MainIDCardModel()
    
    struct Input {
        
    }
    
    final class Output {
        
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        return output
    }
}
