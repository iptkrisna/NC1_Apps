//
//  ViewController.swift
//  NC1_Apps
//
//  Created by I Putu Krisna on 17/05/19.
//  Copyright © 2019 I Putu Krisna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tryButton: RoundedButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tryButtonTapped(_ sender: RoundedButton) {
        
//        UIView.animate(withDuration: 1) {
//            self.tryButton.transform = CGAffineTransform(scaleX: 2, y: 3)
//        }
      

        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.tryButton.transform = CGAffineTransform(translationX: 100, y: 100)
//            print(self.tryButton.frame)
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
//                print(self.tryButton.frame)
                self.tryButton.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
        
//        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 20, initialSpringVelocity: 30, options: .autoreverse, animations: {
//            self.tryButton.transform = CGAffineTransform(translationX: CGFloat.random(in: -100...100), y: CGFloat.random(in: -100...100))
//        }) { (_) in
//            self.tryButton.transform = CGAffineTransform(scaleX: 2, y: 3)
//        }
//
    }
    

}

