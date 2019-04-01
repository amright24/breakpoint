//
//  GroupCell.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/31/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    // O U T L E T S
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members."
        
    }

}
