//
//  ModuleAInterface.swift
//  ModuleA
//
//  Created by zf on 2021/8/22.
//

import Foundation

import SignalBox

public protocol ModuleAInterface: SignalBoxRequiring {
    
    func moduleATest1(_ id: String)
    func moduleATest2(_ id: String) -> String
    func moduleATest3(_ id: [String: Any]) -> (Bool, String)
}
