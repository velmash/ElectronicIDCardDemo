//
//  QRViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

import Combine

class QRViewModel: ViewModelType {
    static func instance() -> QRViewModel {
        return QRViewModel()
    }
    
    let qrModel = QRModel()
    let timerTrigger = PassthroughSubject<Void, Never>()
    
    struct Input {
        let didTapRestartButton: AnyPublisher<Void, Never>
        let remainTime: AnyPublisher<Double, Never>
    }
    
    final class Output {
        @Published var reloadQR: Void?
        @Published var progress: Float?
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.didTapRestartButton
            .compactMap { $0 }
            .assign(to: &output.$reloadQR)
        
        input.remainTime
            .map { Float($0) }
            .assign(to: &output.$progress)
            
        
        return output
    }
}
