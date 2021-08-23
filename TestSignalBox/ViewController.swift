//
//  ViewController.swift
//  TestSignalBox
//
//  Created by jimmy on 2021/8/24.
//

import UIKit
import SignalBox

class ViewController: UIViewController {

    let login = UIButton()
    
    let toA = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        login.frame = CGRect(x: 80, y: 120, width: 60, height: 60)
        login.setTitle("login", for: .normal)
        login.setTitleColor(.black, for: .normal)
        
        view.addSubview(login)
        
        login.addTarget(self, action: #selector(dologin), for: .touchUpInside)
        
        
        toA.frame = CGRect(x: 80, y: 200, width: 60, height: 60)
        toA.setTitle("toA", for: .normal)
        toA.setTitleColor(.black, for: .normal)
        
        view.addSubview(toA)
        
        toA.addTarget(self, action: #selector(doToA), for: .touchUpInside)
    }


    @objc func dologin() {
        SignalBox.shared.userWillLogin()
        let callA = CallModuleAMethod()
        let callB = CallModuleBMethod()
        callA.test1()
        callA.test2()
        callA.test3()
        
        callB.test1()
        callB.test2()
        callB.test3()
    }
    
    @objc func doToA() {
        //SignalBox.shared.router.present("signalbox://mav1")
        //SignalBox.shared.router.present("signalbox://mav2/ssss")
        SignalBox.shared.router.present("signalbox://mav2?p1=wwww")
    }
}
