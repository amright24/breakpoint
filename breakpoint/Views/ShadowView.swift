//
//  ShadowView.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/26/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.65
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        super.awakeFromNib()
    }
}
