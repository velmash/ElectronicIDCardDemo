//
//  QRViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

import Combine

class QRViewModel: ViewModelType {
    let qrModel = QRModel()
    
    struct Input {
        let didTapRestartButton: AnyPublisher<Void, Never>
    }
    
    final class Output {
        @Published var reloadQR: Void?
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.didTapRestartButton
            .compactMap { $0 }
            .assign(to: &output.$reloadQR)
        
        return output
    }
}
