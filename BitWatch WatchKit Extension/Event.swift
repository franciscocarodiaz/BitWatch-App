//
//  Event.swift
//  BitWatch
//
//  Created by Francisco Caro Diaz on 04/02/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Event {
    
    var eventTitle:String
    var eventTime:String
    var eventImageName:String?
    
    init(dataDictionary:Dictionary<String,String>) {
        eventTime = dataDictionary["eventTime"]!
        eventTitle = dataDictionary["eventTitle"]!
        eventImageName = dataDictionary["eventImageName"]
    }
    
    class func newEvent(dataDictionary:Dictionary<String,String>) -> Event {
        return Event(dataDictionary: dataDictionary)
    }
    
    class func eventsList() -> [Event] {
        
        var array = [Event]()
        
        let dataPath = NSBundle.mainBundle().pathForResource("events", ofType: "plist")
        
        let data = NSArray(contentsOfFile: dataPath!)
        
        for e in data as [Dictionary<String, String>] {
            let event = Event(dataDictionary: e)
            array.append(event)
        }
        
        return array
    }
    
}
