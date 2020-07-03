//
//  ViewController+.swift
//  BaseProjectRxSwift
//
//  Created by Kiều anh Đào on 5/29/20.
//  Copyright © 2020 Anhdk. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func customBackground() {
        self.view.backgroundColor = #colorLiteral(red: 0.2992561162, green: 0.8215582371, blue: 0.9889689088, alpha: 1)
        let oval3 = CustomOval(color: #colorLiteral(red: 0.05553479253, green: 0.5948717944, blue: 0.7624905881, alpha: 1), width: 2500, height: 3500, x: -1000, y: -2450)
        oval3.backgroundColor = UIColor.clear
        oval3.alpha = 1
        self.view.addSubview(oval3)
        let oval2 = CustomOval(color: #colorLiteral(red: 0.1476969123, green: 0.7191988826, blue: 0.8988341689, alpha: 1), width: 1000, height: 1500, x: -350, y: -300)
        oval2.backgroundColor = UIColor.clear
        oval2.alpha = 1
        self.view.addSubview(oval2)
        let oval1 = CustomOval(color: #colorLiteral(red: 0.02994276211, green: 0.5896083117, blue: 0.7647932768, alpha: 1), width: 650, height: 1000,x: -100, y: -500)
        oval1.backgroundColor = UIColor.clear
        oval1.alpha = 1
        self.view.addSubview(oval1)
    }
    
    func presentAlert(withTitle title: String, message : String, completion: @escaping (_ action: Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            completion(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {action in
            completion(false)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func showToast(message : String, seconds: Double = 2.0) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
