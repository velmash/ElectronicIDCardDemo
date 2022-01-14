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

class ProfileViewController: BaseViewController<ProfileView, ProfileViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoadTrigger.send(())
    }

    //TODO: viewModel에서 가져온 View에 이미지나 텍스트 바인딩하는 코드 구현
    override func pageBinding() {
        let input = ProfileViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        output.$title
            .sink { [weak self] title in
                self?.myView.title.text = title
            }
            .store(in: &bag)
        
        output.$companyMark
            .sink { [weak self] image in
                self?.myView.companyMark.image = image
            }
            .store(in: &bag)
    }
}
