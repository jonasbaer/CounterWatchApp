//
//  ViewController.swift
//  CounterWatchApp
//
//  Created by Jonas Baer on 22.04.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //------------------- //JB : handleRequest function is specified below...
        NSNotificationCenter.defaultCenter().addObserver(self, selector: ("handleRequest:"), name: "WatchKitDidMakeRequest", object: nil)
        //-------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //-------------------

    //JB : WatchKit Notification
    func handleRequest(notification : NSNotification) {

        let phoneMessage = notification.object! as connectionToWatch

        //JB : Only execute when there is a request from the Watch
        if phoneMessage.watchMessageString != nil {

            //JB : requestedAction is the message we got from the watch, e.g. "GetMessage"
            let requestedAction: String = phoneMessage.watchMessageString!

            switch requestedAction {
            case "GetMessage":
                println("Here you can E X E C U T E something on your Phone") //JB : Make sure string is similar to the message from the Watch
            default:
                println("That didn't work")
            }

            //JB: Here I specify what we reply to the Watch... ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !

            //JB: Specify a Dictionary with firstAnswer as the key and the value is "Hello from your Phone :)"
            let replyToWatchDictionary = ["firstAnswer" : "Connection is established - Hello from your Phone", "secondAnswer" : "This is the second message from your Phone"]

            //JB: Pass this to our PhoneMessage Class to build the reply block
            phoneMessage.replyBlock(replyToWatchDictionary)
        }
    }
    
    //-------------------


}

