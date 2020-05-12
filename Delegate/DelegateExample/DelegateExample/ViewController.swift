//
//  ViewController.swift
//  DelegateExample
//
//  Created by ㅇ오ㅇ on 2020/05/12.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var customView: CustomView!
    @IBOutlet private weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1 바꿀 때 마다 직접 입력
        // 2 뷰컨트롤러에 메서드로 작성
        // 3 커스텀 뷰 구현

//        customView.backgroundColor = nil
        customView.delegate = self
        customView.backgroundColor = .red
     }
}
    
//    func changeBackgroundColor() {
//        let colors: [UIColor] = [.systemRed, .systemBlue, .systemFill]
//        customView.backgroundColor = colors.randomElement()!
//        print(customView.backgroundColor)
//    }
//
//    func colorForBackground(_ newColor: UIColor?) -> UIColor {
//        guard let color = newColor else { return .gray }
//
//        return color != .green ? color : .red
//    }
    
    extension ViewController: CustomViewDelegate {
        func colorForBackground(_ newColor: UIColor?) -> UIColor {
            guard let color = newColor else { return .gray }
            return color != .green ? color : .green
        }
    }
    extension ViewController: UITextFieldDelegate {
        func textFieldDidEndEditing(_ textField: UITextField) {
            guard let text = textField.text else { return }
            switch text {
            case "red" : customView.backgroundColor = .red
            case "blue" : customView.backgroundColor = .blue
            case "black" : customView.backgroundColor = .black
            default: customView.backgroundColor = .gray
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

}
    
    


