//
//  ViewController.swift
//  KitchenClock
//
//  Created by Jorge on 12/1/17.
//  Copyright © 2017 Jorge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var time: Int?
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playButton(_ sender: Any) {

        if (time == nil) || (time == 0) {
            if numberTextField.hasText == false {
                numberTextField.placeholder = "PLEASE INSERT A WHOLE NUMBER"
            } else {
                time = Int(numberTextField.text!)
                screenLabel.text = String(time!)
                numberTextField.isHidden = true
                launchTimer()
            }
        } else {
            numberTextField.isHidden = true
            launchTimer()
        }

    }
    
    @IBAction func lessButton(_ sender: Any) {
        
        if (time != nil) && (time! >= 10){
            time! -= 10
            screenLabel.text = String(time!)
        }
    }
    
    @IBAction func moreButton(_ sender: Any) {
        
        if time != nil{
            time! += 10
            screenLabel.text = String(time!)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        if (time != nil) && (time! > 0) {
            timer.invalidate()
            time! = 0
            screenLabel.text = String(time!)
            numberTextField.text = ""
            numberTextField.isHidden = false
        }
    }
    
    @IBOutlet var numberTextField: UITextField!
    
    @IBOutlet var screenLabel: UILabel!

    func countdown() {
        if time! > 0 {
            time! -= 1
            screenLabel.text = String(time!)
        } else {
            timer.invalidate()
        }
        
        if time! >= 10 {
            screenLabel.textColor = UIColor.black
        }
        
        if (time! > 3) && (time! < 10) {
            screenLabel.textColor = UIColor.orange
        }
        
        if time! <= 3 {
            screenLabel.textColor = UIColor.red
        }
    }
    
    func launchTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
        
    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }
        
        func dismissKeyboard() {
            view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

