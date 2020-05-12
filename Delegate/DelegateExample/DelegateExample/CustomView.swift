//
//  CustomView.swift
//  DelegateExample
//
//  Created by ㅇ오ㅇ on 2020/05/12.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit


protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}

class CustomView: UIView {
    weak var delegate: CustomViewDelegate?
    
    override var backgroundColor: UIColor? {
        get { super.backgroundColor }
        set {
            let color = delegate?.colorForBackground(newValue)
            let newColor = color ?? newValue ?? .gray
            super.backgroundColor = newColor
            
//            if newValue == .green {
//                super.backgroundColor = .blue
//            } else if newValue == nil {
//                super.backgroundColor = .gray
//            } else {
//                super.backgroundColor = newValue
//            }
            
//            super.backgroundColor = newValue ?? .gray // nil이면 그레이
//            if newValue == .green {
//                super.backgroundColor = .blue
            
            
            print("새로 변경될 색은 :", super.backgroundColor)
        }
    }

}
