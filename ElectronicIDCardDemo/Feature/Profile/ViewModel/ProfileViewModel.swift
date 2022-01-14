//
//  ProfileViewModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/14.
//

import Foundation
import Combine
import UIKit

class ProfileViewModel: ViewModelType {
    static func instance() -> ProfileViewModel {
        return ProfileViewModel()
    }
    
    let profileModel = ProfileModel()
    let viewDidLoadTrigger = PassthroughSubject<Void, Never>()
    
    struct Input { }
    
    //TODO: 전자사원증 뷰에 들어가는 데이터 전체 바인딩
    final class Output {
        @Published var title: String?
        @Published var companyMark: UIImage?
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        viewDidLoadTrigger
            .map { [weak self] in
                return output.title == nil ? self?.profileModel.getTitle() : nil
            }
            .assign(to: &output.$title)
        
        viewDidLoadTrigger
            .map { [weak self] in
                return output.companyMark == nil ? self?.profileModel.getPhoto() : nil
            }
            .assign(to: &output.$companyMark)
        
        return output
    }
}
