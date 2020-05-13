//
//  ViewController.swift
//  PlacticeDelegate
//
//  Created by ㅇ오ㅇ on 2020/05/13.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

//protocol textDelegateDelivery: class {
//    func goData(data: String)
//}

class FirstViewController: UIViewController, textDelegateDelivery {

//    weak var delegate: textDelegateDelivery?
    
    func textField(for text: UITextField, title: String, frame: CGRect) {
        text.frame = frame
        text.placeholder = "적어봐"
        text.borderStyle = .roundedRect
        text.center = view.center
        view.addSubview(text)
    }
    
    func buttonNextGo(for button: UIButton, title: String, frame: CGRect) {
        button.frame = frame
        button.setTitle("GO Next Page", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(goNextPage(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    let textInBox = UITextField()
    let goButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UI()
    }
    
    func UI() {
        let textFrame = CGRect(x: 50, y: 50, width: 300, height: 40)
        textField(for: textInBox, title: "", frame: textFrame)
        
        let buttonFrame = CGRect(x: 40, y: 200, width: 300, height: 40)
        buttonNextGo(for: goButton, title: "GO Next Page", frame: buttonFrame)
    }
    
    @objc func goNextPage(_ sender: UIButton) {
        let secondvc = SecondViewController()
        secondvc.modalPresentationStyle = .automatic
        if let data = textInBox.text {
        present(secondvc, animated: true)
        }
    }
    
    func goData() -> String {
        return textInBox.text!
    }

}

