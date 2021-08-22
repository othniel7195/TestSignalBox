//
//  ModuleBImp.swift
//  ModuleB
//
//  Created by zf on 2021/8/22.
//

import Foundation
import SignalBox

class ModuleBProvider: SignalBoxProviding {
    let context: SignalBoxContext
    required init(context: SignalBoxContext) {
        self.context = context
    }
    
    func userWillLogin() {
        print("moduleB user will login")
    }
    
    func moduleOpen(launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("moduleB launch start->\(String(describing: launchOptions))")
        return true
    }

}

extension ModuleBProvider: ModuleBInterface {
    
    func moduleBTest1(_ id: String) {
        print("mouduleB test1 id:\(id)")
    }
    func moduleBTest2(_ id: String) -> String {
        print("mouduleB test2 id:\(id)")
        
        return "moduleB test2 -> 123"
    }
    func moduleBTest3(_ id: [String : Any]) -> (Bool, String) {
        print("mouduleB test3 id:\(id)")
        
        return (true, "moduleB test3 -> 456")
    }
    
}


extension ModuleBProvider: ModuleURLMap {
    var moduleURLRoutes: [String : ViewControllerFactory]? {
        return ["signalbox://mbv1": ModuleBTestURLRoute.getModuleBVC1,
                "signalbox://mbv2/<string:p1>": ModuleBTestURLRoute.getModuleBVC2,
                "signalbox://mbv2": ModuleBTestURLRoute.getModuleBVC2_2,
        ]
    }
    
    var moduleURLHandles: [String : URLOpenHandleFactory]? {
        return ["signalbox://moduleB.route1": ModuleBTestURLRoute.moduleBTestURLRoute1,
                "signalbox://moduleB.route2/<string:p1>": ModuleBTestURLRoute.moduleBTestURLRoute2WithValues,
                "signalbox://moduleB.route3": ModuleBTestURLRoute.moduleBTestURLRoute3WithItems,
        ]
    }
}


class ModuleBTestURLRoute {
    static func getModuleBVC1(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> UIViewController {
        print("moduleB vc1 url:\(url) -> values:\(values) -> context:\(String(describing: context))")
        return MBVC1()
    }
    
    static func getModuleBVC2(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> UIViewController {
        print("moduleB vc2 url:\(url) -> values:\(values) -> context:\(String(describing: context))")
        return MBVC2(str: (values["p1"] as? String) ?? "NULL")
    }
    static func getModuleBVC2_2(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> UIViewController {
        print("moduleB vc2 url:\(url) -> values:\(values) -> context:\(String(describing: context))")
        let item = url.queryItems?.first(where: { item -> Bool in
            return item.name == "p1"
        })
        return MBVC2(str: item?.value ?? "NULL")
    }
    
    static func moduleBTestURLRoute1(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> URLOpenResult {
        print("moduleB test url route 1")
        return .voidSuccess
    }
    
    static func moduleBTestURLRoute2WithValues(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> URLOpenResult {
        print("moduleB test url route 1 -- with values: \(values)")
        return .success(values["p1"] ?? "NULL")
    }
    
    static func moduleBTestURLRoute3WithItems(_ url: URLAnalysis, _ values: [String: Any], _ context: Any?) -> URLOpenResult {
        print("moduleB test url route 1 ~~~~~ with query items: \(String(describing: url.queryItems))")
        let item = url.queryItems?.first(where: { item -> Bool in
            return item.name == "p1"
        }).map({ item -> [String: Any] in
            return [item.name: item.value ?? "NULL"]
        })
        return .failed(item ?? "NULL")
    }
}
