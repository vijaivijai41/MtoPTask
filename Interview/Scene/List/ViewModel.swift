//
//  ViewModel.swift
//  Interview
//
//  Created by vijay kumar on 20/02/22.
//



import Foundation
import MtoPInterview


struct UserModel {
    let username: String
    let encriptInfo: UserInfoEncription
}

protocol ViewDelegate: AnyObject {
    func viewModel(viewModel: ViewModel, successSave userInfo: UserInfo)
    func viewModel(viewModel: ViewModel, failureSave error: String)

}

class ViewModel {
    weak var viewDelegate: ViewDelegate?
    let credentials: UserCredentials = UserCredentials()
    var userModel: [UserModel] = []
    
    func submitAction(userName: String, password: String) {
        let userInfo = UserInfo(userName: userName, password: password)
        credentials.saveUserInfo(user: userInfo) { result in
            switch result {
            case .success(let encryptInfo):
                let user = UserModel(username: userName, encriptInfo: encryptInfo)
                self.userModel.append(user)
                self.viewDelegate?.viewModel(viewModel: self, successSave: userInfo)
            case .failure(let error):
                self.viewDelegate?.viewModel(viewModel: self, failureSave: error.localizedDescription)
            }
        }
    }
}
