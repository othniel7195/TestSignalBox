//
//  ModuleBVC2.swift
//  ModuleB
//
//  Created by jimmy on 2021/8/24.
//

import Foundation
import UIKit

class MBVC2: UIViewController {
    let btn1 = UIButton()
    let label1 = UILabel()
    let str: String
    init(str: String) {
        self.str = str
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("-----")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        label1.frame = CGRect(x: 20, y: 80, width: 200, height: 80)
        label1.text = str
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
