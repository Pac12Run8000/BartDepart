//
//  sAdvisory.swift
//  BartDepart
//
//  Created by MIchelle Grover on 4/6/16.
//  Copyright © 2016 Norbert Grover. All rights reserved.
//

import Foundation

class sAdvisory : UIViewController {
    override func viewDidLoad() {
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }




}