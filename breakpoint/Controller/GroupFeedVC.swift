//
//  GroupFeedVC.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/31/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {
    
    // O U T L E T S
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var groupVC = GroupsVC()
    var group: Group?
    var groupMessages = [Message]()
    
    func initGroupData(forGroup group: Group) {
        self.group = group
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmails(group: group!) { (returnedEmails) in
            self.memberLbl.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0{
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail(groupVC)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.groupKey) { (complete) in
                if complete {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            }
        }
    }

}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
    }
}

