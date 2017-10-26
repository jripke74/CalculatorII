//
//  ViewController.swift
//  CalculatorII
//
//  Created by Jeff Ripke on 10/26/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calcDisplayLabelString = "0"
    var currentMode: CalculatorMode = .notSet
    var savedNum = 0
    var lastButtonWasMode = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    

}
