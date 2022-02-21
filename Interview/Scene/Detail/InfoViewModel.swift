//
//  InfoViewModel.swift
//  Interview
//
//  Created by vijay kumar on 20/02/22.
//

import Foundation
import MtoPInterview

protocol InfoViewModelViewDelegate: AnyObject {
    func viewModel(viewModel: InfoViewModel, successDecriptionUserInfo info: UserInfo)
}

class InfoViewModel {
    let userinfo: UserModel
    let credentials: UserCredentials = UserCredentials()
    weak var viewDelegate: InfoViewModelViewDelegate?

    init(userModel: UserModel, viewDelegate: InfoViewModelViewDelegate) {
        self.userinfo = userModel
        self.viewDelegate = viewDelegate
    }
    
    func displayInfo() {
        credentials.retriveUserInfo(userInfo: self.userinfo.encriptInfo) { result in
            switch result {
            case .success(let userInfo):
                self.viewDelegate?.viewModel(viewModel: self, successDecriptionUserInfo: userInfo)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
