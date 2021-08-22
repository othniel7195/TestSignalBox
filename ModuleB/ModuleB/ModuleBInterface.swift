//
//  ModuleBInterface.swift
//  ModuleB
//
//  Created by zf on 2021/8/22.
//

import Foundation

import SignalBox

public protocol ModuleBInterface: SignalBoxRequiring {
    
    func moduleBTest1(_ id: String)
    func moduleBTest2(_ id: String) -> String
    func moduleBTest3(_ id: [String: Any]) -> (Bool, String)
}
