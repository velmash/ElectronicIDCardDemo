//
//  ProfileViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

import Foundation
import Combine

class ProfileViewModel: ViewModelType {
    let profileModel = ProfileModel()
    
    struct Input {
        let viewLoaded: AnyPublisher<Void, Never>
    }
    
    final class Output {
        @Published var title: String?
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewLoaded
            .map { [weak self] in
                return output.title == nil ? self?.profileModel.getTitle() : nil
            }
            .assign(to: &output.$title)
        
        return output
    }
}
