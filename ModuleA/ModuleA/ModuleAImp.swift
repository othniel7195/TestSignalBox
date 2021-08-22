//
//  ModuleAImp.swift
//  ModuleA
//
//  Created by zf on 2021/8/22.
//

import Foundation
import SignalBox

class ModuleAProvider: SignalBoxProviding {
    let context: SignalBoxContext
    required init(context: SignalBoxContext) {
        self.context = context
    }
    
    func userWillLogin() {
        print("moduleA user will login")
    }
    
    func moduleOpen(launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("moduleA launch start->\(String(describing: launchOptions))")
        return true
    }

}

extension ModuleAProvider: ModuleAInterface {
    
    func moduleATest1(_ id: String) {
        print("mouduleA test1 id:\(id)")
    }
    func moduleATest2(_ id: String) -> String {
        print("mouduleA test2 id:\(id)")
        
        return "moduleA test2 -> 123"
    }
    func moduleATest3(_ id: [String : Any]) -> (Bool, String) {
        print("mouduleA test3 id:\(id)")
        
        return (true, "moduleA test3 -> 456")
    }
    
}


extension ModuleAProvider: ModuleURLMap {
    var moduleURLRoutes: [String : ViewControllerFactory]? {
        return ["signalbox://mav1": ModuleATestURLRoute.getModuleAVC1,
                "signalbox://mav2/<string:p1>": ModuleATestURLRoute.getModuleAVC2,
                "signalbox://mav2": ModuleATestURLRoute.getModuleAVC2_2,
        ]
    }
    
    var moduleURLHandles: [String : URLOpenHandleFactory]? {
        return ["signalbox://moduleA.route1": ModuleATestURLRoute.moduleATestURLRoute1,
                "signalbox://moduleA.route2/<string:p1>": ModuleATestURLRoute.moduleATestURLRoute2WithValues,
                "signalbox://moduleA.route3": ModuleATestURLRoute.moduleATestURLRoute3WithItems,
        ]
    }
}


struct ModuleATestURLRoute {
    static func getModuleAVC1(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> UIViewController {
        print("moduleA vc1 url:\(url) -> values:\(values) -> context:\(String(describing: context))")
        return MAVC1()
    }
    
    static func getModuleAVC2(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> UIViewController {
        print("moduleA vc2 url:\(url) -> values:\(values) -> context:\(String(describing: context))")
        return MAVC2((values["p1"] as? String) ?? "NULL")
    }
    static func getModuleAVC2_2(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> UIViewController {
        print("moduleA vc2 url:\(url) -> values:\(values) -> context:\(String(describing: context))")
        let item = url.queryItems?.first(where: { item -> Bool in
            return item.name == "p1"
        })
        return MAVC2(item?.value ?? "NULL")
    }
    
    static func moduleATestURLRoute1(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> URLOpenResult {
        print("moduleA test url route 1")
        return .voidSuccess
    }
    
    static func moduleATestURLRoute2WithValues(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> URLOpenResult {
        print("moduleA test url route 1 -- with values: \(values)")
        return .success(values["p1"] ?? "NULL")
    }
    
    static func moduleATestURLRoute3WithItems(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> URLOpenResult {
        print("moduleA test url route 1 ~~~~~ with query items: \(String(describing: url.queryItems))")
        let item = url.queryItems?.first(where: { item -> Bool in
            return item.name == "p1"
        }).map({ item -> [String: Any] in
            return [item.name: item.value ?? "NULL"]
        })
        return .failed(item ?? "NULL")
    }
}
