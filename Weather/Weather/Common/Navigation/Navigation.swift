//
//  Navigation.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

protocol Navigation {
    
    static func usecase() -> String
    
    static func openUrl(_ url: URL, parameters: [String:AnyObject]?, completion: NavigationCallback?) -> Bool
    
}

extension Navigation {
    
    static func keyWindow() -> UIWindow {
        guard let window = UIApplication.shared.keyWindow else {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.window = UIWindow(frame: UIScreen.main.bounds)
            delegate.window?.makeKeyAndVisible()
            return delegate.window!
        }
        
        return window
    }
    
    static func topViewController() -> UIViewController? {
        var topController = keyWindow().rootViewController
        
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }
        
        return topController
    }
    
    static func topNavigationController() -> UINavigationController? {
        var topController = keyWindow().rootViewController
        
        var underTopController: UIViewController?
        
        while let presentedViewController = topController?.presentedViewController {
            underTopController = topController
            topController = presentedViewController
        }
        
        if let navigationController = topController as? UINavigationController {
            return navigationController
        }
        
        if let _ = topController as? UISearchController {
            if let navController = underTopController as? UINavigationController {
                return navController
            }
        }
        
        return topController?.navigationController
    }
    
    static func url() -> URL {
        return buildURLWithPath(nil, parameters: nil)
    }
    
    static func buildURLWithPath(_ path: String?, parameters: [String:String]?) -> URL {
        return URLBuilder.buildURLWith(host: usecase(), path: path, parameters: parameters)
        
    }
    
}
