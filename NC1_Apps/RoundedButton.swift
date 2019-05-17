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
    }

}
