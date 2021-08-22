//
//  ModuleBConfig.swift
//  TestSignalBox
//
//  Created by jimmy on 2021/8/24.
//

import Foundation
import SignalBox
import ModuleB

struct ModuleBConfig: ModuleSignalType {
    var providerName: String {
        return "ModuleBProvider"
    }
    
    var moduleName: String {
        return "ModuleB"
    }
    
    var requringName: String {
        return "ModuleBInterface"
    }
}

struct CallModuleBMethod {
    let requiring: ModuleBInterface? = SignalBox.shared.requiring()
    
    func test1() {
        requiring?.moduleBTest1("call m b 1")
    }
    func test2() {
        print(requiring?.moduleBTest2("call m b 2") ?? "call m b 2 failed")
    }
    func test3() {
        let r = requiring?.moduleBTest3(["mb3": "tatata"])
        print("call m b 3 result: \(String(describing: r))")
    }
}
