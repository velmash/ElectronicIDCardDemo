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
    
    //TODO: 전자사원증 뷰에 들어가는 데이터 전체 바인딩
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
