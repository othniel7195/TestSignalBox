//
//  File.swift
//  TestSignalBox
//
//  Created by zf on 2021/8/22.
//

import Foundation
import SignalBox
import ModuleA

struct ModuleAConfig: ModuleSignalType {
    var providerName: String {
        return "ModuleAProvider"
    }
    
    var moduleName: String {
        return "ModuleA"
    }
    
    var requringName: String {
     return "ModuleAInterface"
    }
}


struct CallModuleAMethod {
    let requiring: ModuleAInterface? = SignalBox.shared.requiring()
    
    func test1() {
        requiring?.moduleATest1("call m a 1")
    }
    func test2() {
        print(requiring?.moduleATest2("call m a 2") ?? "call m a 2 failed")
    }
    func test3() {
        let r = requiring?.moduleATest3(["ma3": "hahaha"])
        print("call m a 3 result: \(String(describing: r))")
    }
}
