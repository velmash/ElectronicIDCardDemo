//
//  MainIDCardViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

import Combine

class MainIDCardViewModel: ViewModelType {
    static func instance() -> MainIDCardViewModel {
        return MainIDCardViewModel()
    }
    
    let mainModel = MainIDCardModel()
    
    struct Input {
        let didTapRestartButton: AnyPublisher<Void, Never>
    }
    
    final class Output {
        @Published var closePage: Void?
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.didTapRestartButton
            .compactMap { $0 }
            .assign(to: &output.$closePage)
        
        return output
    }
}
