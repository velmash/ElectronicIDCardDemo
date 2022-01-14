//
//  ProfileViewController.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit
import SnapKit
import CombineCocoa
import Combine

class ProfileViewController: BaseViewController<ProfileView> {
    
    private let viewModel = ProfileViewModel()
    
    let testPublisher = Just(())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    //TODO: viewModel에서 가져온 View에 이미지나 텍스트 바인딩하는 코드 구현
    override func pageBinding() {
        let input = ProfileViewModel.Input(
            viewLoaded: testPublisher.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(input: input)
        
        output.$title
            .sink { [weak self] title in
                self?.myView.title.text = title
            }
            .store(in: &bag)
    }
}
