//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


var player: AVAudioPlayer?

class ViewController: UIViewController {

	override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func keyPressed(_ sender: UIButton) {
		let title = sender.currentTitle ?? "A"
		playSound(toneTitle: title)
		
		sender.alpha = 0.5
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				//Bring's sender's opacity back up to fully opaque.
				sender.alpha = 1.0
		}
		
	}
	
	func playSound(toneTitle: String) {
			guard let path = Bundle.main.path(forResource: toneTitle, ofType:"wav") else {
					return }
			let url = URL(fileURLWithPath: path)

			do {
					player = try AVAudioPlayer(contentsOf: url)
					player?.play()
					
			} catch let error {
					print(error.localizedDescription)
			}
	}
	
    

}

