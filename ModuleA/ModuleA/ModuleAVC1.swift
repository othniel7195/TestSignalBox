//
//  File.swift
//  ModuleA
//
//  Created by zf on 2021/8/22.
//

import Foundation
import UIKit

class MAVC1: UIViewController {
    let btn1 = UIButton()
    let label1 = UILabel()
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("-----")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        label1.frame = CGRect(x: 20, y: 80, width: 200, height: 80)
        label1.text = "MAVC1"
        label1.textColor = .red
        
        view.addSubview(label1)
        
        btn1.frame = CGRect(x: 40, y: 200, width: 60, height: 60)
        btn1.setTitle("back", for: .normal)
        btn1.setTitleColor(.black, for: .normal)
        btn1.addTarget(self, action: #selector(doBack), for: .touchUpInside)
        view.addSubview(btn1)
    }
    
    @objc func doBack() {
        dismiss(animated: true, completion: nil)
    }
}
