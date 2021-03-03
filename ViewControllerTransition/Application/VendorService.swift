//
//  VendorService.swift
//  ViewControllerTransition
//
//  Created by Serg Liamthev on 03.03.2021.
//  Copyright © 2021 Serg Liamthev. All rights reserved.
//

import UIKit

final class VendorService: NSObject {
    
    static let shared: VendorService = VendorService()
    
    private override init() {
        super.init()
    }
    
    static func start(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        // NOTE: - Disable unsatisfiable constraints debug logs
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    
}
