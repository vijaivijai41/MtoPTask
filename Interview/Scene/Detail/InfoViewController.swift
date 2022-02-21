//
//  InfoViewController.swift
//  Interview
//
//  Created by vijay kumar on 20/02/22.
//

import UIKit
import MtoPInterview

class InfoViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var info: UserModel!
    var viewModel: InfoViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.displayInfo()
        // Do any additional setup after loading the view.
    }
    

}

extension InfoViewController: InfoViewModelViewDelegate {
    
    func viewModel(viewModel: InfoViewModel, successDecriptionUserInfo info: UserInfo) {
        self.userNameLabel.text = info.userName
        self.passwordLabel.text = info.password
    }

}
