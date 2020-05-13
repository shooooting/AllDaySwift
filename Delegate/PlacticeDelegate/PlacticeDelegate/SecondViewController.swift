//
//  SecondViewController.swift
//  PlacticeDelegate
//
//  Created by ㅇ오ㅇ on 2020/05/13.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

protocol textDelegateDelivery: class {
    func goData() -> String
}

class SecondViewController: UIViewController {
    
    weak var delegate: textDelegateDelivery!
    
    func inToLabel(for label: UILabel, title: String, frame: CGRect) {
        label.frame = frame
        label.backgroundColor = .red
        view.addSubview(label)
        
    }
    
    let labelInText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = presentingViewController as? FirstViewController
        delegate = viewController
        
        view.backgroundColor = .systemBackground
        
        label()
        labelInText.text = delegate.goData()
        
    }
    
    func label() {
        let labelFrame = CGRect(x: 30, y: 100, width: 300, height: 50)
        inToLabel(for: labelInText, title: "", frame: labelFrame)
    }
    
//    func goData(data: String) {
//        labelInText.text = data
//    }
    



}
