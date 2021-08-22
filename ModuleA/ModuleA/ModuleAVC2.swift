//
//  ModuleAVC2.swift
//  ModuleA
//
//  Created by jimmy on 2021/8/24.
//

import Foundation
import UIKit
import SignalBox

class MAVC2: UIViewController {
    let btn1 = UIButton()
    let label1 = UILabel()
    let str: String
    let toB = UIButton()
    init(_ str: String) {
        self.str = str
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("-----")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        label1.frame = CGRect(x: 20, y: 80, width: 200, height: 80)
        label1.text = str
        label1.textColor = .red
        
        view.addSubview(label1)
        
        btn1.frame = CGRect(x: 40, y: 200, width: 60, height: 60)
        btn1.setTitle("back", for: .normal)
        btn1.setTitleColor(.black, for: .normal)
        btn1.addTarget(self, action: #selector(doBack), for: .touchUpInside)
        view.addSubview(btn1)
        
        toB.frame = CGRect(x: 40, y: 300, width: 60, height: 60)
        toB.setTitle("toB", for: .normal)
        toB.setTitleColor(.black, for: .normal)
        toB.addTarget(self, action: #selector(dotoB), for: .touchUpInside)
        view.addSubview(toB)
    }
    
    @objc func doBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dotoB() {
        _ = SignalBox.shared.router.handler(url: "signalbox://moduleB.route1")
        let r = SignalBox.shared.router.handler(url: "signalbox://moduleB.route2/123")
        switch r {
        case .success(let v):
            SignalBox.shared.router.present("signalbox://mbv2/\(v)")
        case .failed:
            print("to b failed")
        }
    }
}
