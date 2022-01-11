//
//  SomeDataModel.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/11.
//

import Foundation
import UIKit

struct SomeDataModel {
    enum DataModelType: String {
        case profile
        case QR
    }

    let type: DataModelType

    var name: String {
        return type.rawValue
    }

    var view: UIView {
        switch type {
        case .profile: return ProfileView()
        case .QR: return QRView()
        }
    }

}

struct Mocks {
    static func getDataSource() -> [SomeDataModel] {
        return [SomeDataModel(type: .profile),
                SomeDataModel(type: .QR)]
    }
}
