//
//  GroupFeedCell.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/31/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    
    // O U T L E T S
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}
