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
    
    func tappedNumber(num: Int) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            calcDisplayLabelString = "0"
        }
        calcDisplayLabelString += "\(num)"
        updateText()
    }
    
    func updateText() {
        guard let displayedNumber = Int(calcDisplayLabelString) else {
            displayLabel.text = "Int conversion failed"
            return
        }
        if currentMode == .notSet {
            savedNum = displayedNumber
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let num = NSNumber(value: displayedNumber)
        displayLabel.text = formatter.string(from: num)
    }
    
    func changeMode(newMode: CalculatorMode) {
        if savedNum == 0 {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }
    
    @IBAction func zeroBtnTapped(_ sender: UIButton) { tappedNumber(num: 0) }
    @IBAction func oneBtnTapped(_ sender: UIButton) { tappedNumber(num: 1) }
    @IBAction func twoBtnTapped(_ sender: UIButton) { tappedNumber(num: 2) }
    @IBAction func threeBtnTapped(_ sender: UIButton) { tappedNumber(num: 3) }
    @IBAction func fourBtnTapped(_ sender: UIButton) { tappedNumber(num: 4) }
    @IBAction func fiveBtnTapped(_ sender: UIButton) { tappedNumber(num: 5) }
    @IBAction func sixBtnTapped(_ sender: UIButton) { tappedNumber(num: 6) }
    @IBAction func sevenBtnTapped(_ sender: UIButton) { tappedNumber(num: 7) }
    @IBAction func eightBtnTapped(_ sender: UIButton) { tappedNumber(num: 8) }
    @IBAction func nineBtnTapped(_ sender: UIButton) { tappedNumber(num: 9) }
    
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        changeMode(newMode: .addition)
    }
    
    @IBAction func minusBtnTapped(_ sender: UIButton) {
        changeMode(newMode: .subtraction)
    }
    
    @IBAction func multiplyBtnTapped(_ sender: UIButton) {
        changeMode(newMode: .mutliplication)
    }
    
    @IBAction func divisionBtnTapped(_ sender: UIButton) {
        changeMode(newMode: .division)
    }
    
    @IBAction func equalBtnTapped(_ sender: UIButton) {
        guard let num = Int(calcDisplayLabelString) else {
            return
        }
        if lastButtonWasMode {
            return
        }
        switch currentMode {
        case .addition:
            savedNum += num
        case .subtraction:
            savedNum -= num
        case .mutliplication:
            savedNum *= num
        case .division:
            savedNum /= num
        case .notSet:
            return
        }
        currentMode = .notSet
        calcDisplayLabelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    @IBAction func clearBtnTapped(_ sender: UIButton) {
        savedNum = 0
        calcDisplayLabelString = "0"
        displayLabel.text = "0"
        lastButtonWasMode = false
    }
}
