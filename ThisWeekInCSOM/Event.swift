//
//  Event.swift
//  ThisWeekInCSOM
//
//  Created by Angela Zhang on 7/28/2013.
//  Copyright © 2017 Angela Zhang. All rights reserved.
//

import Foundation

class Event: NSObject, NSCoding {
    var name: String
    //"Google Luncheon", "iOS Introductory Workshop", "Hackathon","TechTrekNYC", "WIB meeting", "Dean's Coffee", "Marketing club breakfast", "PwC Women In Tech Talk"
    var date: String
    //["4/20/17", "4/22/17", "4/23/17", "4/23/17", "4/24/17","4/24/17","4/24/17","4/24/17" ]
    var desc: String
    var time: String
    var location: String
    var link: String
    var email: String
    
    init(name: String, date: String, desc: String, time: String, location: String, link: String, email: String) {
        self.name = name
        self.date = date
        self.desc = desc
        self.time = time
        self.location = location
        self.link = link
        self.email = email
    }
    
    // CODING STUFF
    required convenience init?(coder decoder: NSCoder) {
        guard let name = decoder.decodeObject(forKey: "name") as? String,
            let date = decoder.decodeObject(forKey: "date") as? String,
            let desc = decoder.decodeObject(forKey: "desc") as? String,
            let time = decoder.decodeObject(forKey: "time") as? String,
            let location = decoder.decodeObject(forKey: "location") as? String,
            let link = decoder.decodeObject(forKey: "link") as? String,
            let email = decoder.decodeObject(forKey: "email") as? String
            else { return nil }
        
        self.init(name: name, date: date, desc: desc, time: time, location: location, link: link, email: email)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.date, forKey: "date")
        coder.encode(self.desc, forKey: "desc")
        coder.encode(self.time, forKey: "time")
        coder.encode(self.location, forKey: "location")
        coder.encode(self.link, forKey: "link")
        coder.encode(self.email, forKey: "email")
    }
    
}
