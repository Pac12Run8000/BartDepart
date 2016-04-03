//
//  realTimeDepartures.swift
//  BartDepart
//
//  Created by MIchelle Grover on 4/2/16.
//  Copyright © 2016 Norbert Grover. All rights reserved.
//

import Foundation

class realTimeDepartures : UIViewController {
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}