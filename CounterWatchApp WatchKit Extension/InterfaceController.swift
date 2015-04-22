//
//  InterfaceController.swift
//  CounterWatchApp WatchKit Extension
//
//  Created by Jonas Baer on 22.04.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var startButtonLabel: WKInterfaceButton!
    @IBOutlet weak var instructionLabel: WKInterfaceLabel!
    @IBOutlet weak var timerViewLabel: WKInterfaceTimer!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        instructionLabel.setText("")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func startButtonPressed() {
        instructionLabel.setText("Get some shit done !!!")

        timerViewLabel.setTextColor(UIColor.redColor())
        timerViewLabel.start()

        startButtonLabel.setAlpha(0.4)
        startButtonLabel.setEnabled(false)
    }

    @IBAction func resetButtonPressed() {
        instructionLabel.setText("")

        timerViewLabel.setTextColor(UIColor.whiteColor())
        timerViewLabel.stop()

        startButtonLabel.setAlpha(1)
        startButtonLabel.setEnabled(true)
    }
}
