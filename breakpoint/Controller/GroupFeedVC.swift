//
//  GroupFeedVC.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/31/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {
    
    // O U T L E T S
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var group: Group?
    
    func initGroupData(forGroup group: Group) {
        self.group = group
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmails(group: group!) { (returnedEmails) in
            self.memberLbl.text = returnedEmails.joined(separator: ", ")

        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }

}

