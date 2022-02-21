//
//  UIViewController+Extension.swift
//  Interview
//
//  Created by vijay kumar on 20/02/22.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
