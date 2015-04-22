//
//  connectionToWatch.swift
//  CounterWatchApp
//
//  Created by Jonas Baer on 22.04.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import Foundation

//-------------------
class connectionToWatch {

    //JB : Chance that this var doesn't exist - make it optional ;)
    var watchMessageString: String?

    //JB : Used to index the dictionary
    let key = "FunctionsRequestKey"

    //JB : Create a block of the same type as the one in AppDelegate / requires Inititalizer
    var replyBlock: ([NSObject : AnyObject]!) -> Void

    //JB : Initalizer for the replyBlock, with second element seperated by comma
    init (storeDictionary: [NSObject : AnyObject], reply: ([NSObject : AnyObject]!) -> Void) {

        //JB : When the storeDictionary is not nil and key = string and value = string too... then...
        if let storeDictionary = storeDictionary as? [String : String] {
            self.watchMessageString = storeDictionary[self.key]
        }
        else {
            println("No information error")
        }

        //JB : Store it in the replyBlock
        replyBlock = reply
    }
}
//-------------------
