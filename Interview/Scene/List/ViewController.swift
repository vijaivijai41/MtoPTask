//
//  ViewController.swift
//  Interview
//
//  Created by vijay kumar on 18/02/22.
//

import UIKit
import MtoPInterview

class UserinfoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userNameTxt: UITextField!

    let viewModel: ViewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitTap(_ sender: UIButton) {
        if let username = self.userNameTxt.text, !username.isEmpty {
            if let password = self.passwordTxt.text, !password.isEmpty {
                self.viewModel.submitAction(userName: username, password: password)
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserinfoCell", for: indexPath) as! UserinfoCell
        cell.nameLabel.text = self.viewModel.userModel[indexPath.row].username
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showInfoController(user: self.viewModel.userModel[indexPath.row])
    }
    
    func showInfoController(user: UserModel) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let infoController = storyBoard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        let viewModel = InfoViewModel(userModel: user, viewDelegate: infoController)
        infoController.viewModel = viewModel
        self.navigationController?.pushViewController(infoController, animated: true)
    }
}




extension ViewController: ViewDelegate {
    func viewModel(viewModel: ViewModel, successSave userInfo: UserInfo) {
        self.showAlert(message: "user data append success")
        self.userNameTxt.text = ""
        self.passwordTxt.text = ""
        self.tableView.reloadData()
    }
    
    func viewModel(viewModel: ViewModel, failureSave error: String) {
        self.showAlert(message: error)
    }
    

}
