//
//  MyRoundedButton.swift
//  NC1_Apps
//
//  Created by I Putu Krisna on 17/05/19.
//  Copyright © 2019 I Putu Krisna. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = layer.frame.width/2
        layer.borderColor  = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        layer.borderWidth  = 2
    }

}
