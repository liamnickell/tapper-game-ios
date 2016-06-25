//
//  ViewController.swift
//  tapper-game
//
//  Created by Liam Nickell on 6/25/16.
//  Copyright © 2016 Liam Nickell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var playBtn: UIButton!
	@IBOutlet weak var tapBtn: UIButton!
	@IBOutlet weak var numOfTapsLbl: UILabel!
	@IBOutlet weak var errorMsg: UILabel!
	
	var timer = NSTimer()
	
	var taps = 0
	var requiredTaps = 0

	func delay(delay: Double, closure: ()->()) {
		dispatch_after(
			dispatch_time(
				DISPATCH_TIME_NOW,
				Int64(delay * Double(NSEC_PER_SEC))
				),
			dispatch_get_main_queue(),
			closure)
	}
	
	@IBAction func playBtn(sender: AnyObject) {
		if let num = Int(textField.text!) {
			requiredTaps = num
			numOfTapsLbl.text = "\(taps) Taps"
		
			textField.hidden = true
			logo.hidden = true
			playBtn.hidden = true
		
			numOfTapsLbl.hidden = false
			tapBtn.hidden = false
		} else {
			textField.hidden = true
			logo.hidden = true
			playBtn.hidden = true
			tapBtn.hidden = true
			numOfTapsLbl.hidden = true
			
			errorMsg.hidden = false
			
			delay(3.0){
				self.resetGame()
				self.errorMsg.hidden = true
			}
		}
	}
	
	func resetGame() {
		taps = 0
		requiredTaps = 0
		numOfTapsLbl.text = ""
		textField.text = ""
		
		textField.hidden = false
		logo.hidden = false
		playBtn.hidden = false
		
		numOfTapsLbl.hidden = true
		tapBtn.hidden = true
	}
	
	@IBAction func tapBtn(sender: AnyObject) {
		taps++
		numOfTapsLbl.text = "\(taps) Taps"
		
		if taps == requiredTaps {
			tapBtn.hidden = true
			numOfTapsLbl.text = "You Win!"
			
			delay(3.0){
				self.resetGame()
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

