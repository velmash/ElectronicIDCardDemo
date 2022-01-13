//
//  WorkCommutingViewController+Extension.swift
//  ElectronicIDCardDemo
//
//  Created by hyengchan on 2022/01/13.
//

import UIKit

extension WorkCommutingViewController {
    enum FormatterType {
        case detail
        case normal
    }
    
    enum CommuteType: String {
        case commute = "출근"
        case leave = "퇴근"
    }
    
    private func getTimeNow(_ type: FormatterType) -> String {
        let formatter = DateFormatter()
        if case .detail = type {
            formatter.dateFormat = "HH:mm:ss"
        } else {
            formatter.dateFormat = "HH:mm"
        }
        let currentDateString = formatter.string(from: Date())
        return currentDateString
    }
    
    internal func getDayToday() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy.MM.dd (EE)"
        let currentDateString = formatter.string(from: Date())
        return currentDateString
    }
}


extension WorkCommutingViewController {
    internal func showAlarm(_ type: CommuteType) {
        let alertController = UIAlertController(
            title: "알림",
            message: "\(type.rawValue)시간을\n 등록하시겠습니까?",
            preferredStyle: .alert
        )
        let deleteAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.myView.commuteTime.text = self.getTimeNow(.detail)
            if case .commute = type {
                if self.myView.commutingReportView.onTimeDetail.text == "미등록" {
                    self.myView.commutingReportView.onTimeDetail.text = self.getTimeNow(.normal)
                } else {
                    self.toastViewTrigger.send(())
                }
               
            } else {
                self.myView.commutingReportView.offTimeDetail.text = self.getTimeNow(.normal)
            }
            
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
