////
////  BCLocation.swift
////  ThisWeekInCSOM
////
////  Created by Angela Zhang on 4/20/17
////  Copyright © 2017 Angela Zhang. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class BCLocation {
//    var currentTime = 0.0
//    var timeZone = ""
//    
//    func getTime(completed: @escaping () -> ()) {
//        let bcURL = "https://api.darksky.net/forecast/0306c9a3fe7e260911000046798b4eba/42.334678,-71.170077"
//        
//        Alamofire.request(bcURL).responseJSON { response in
//            switch response.result {
//            case .success (let value):
//                let json = JSON(value)
//                if let time = json["currently"]["time"].double {
//                    print("TIME inside getTime = \(time)")
//                    self.currentTime = time
//                } else {
//                    print("Could not retrieve time")
//                }
//                if let timeZone = json["timezone"].string {
//                    print("timezone inside getTime = \(timeZone)")
//                    self.timeZone = timeZone
//                } else {
//                    print("Could not retrieve timeZone")
//                }
//                
//            case .failure(let error):
//                print (error)
//                
//            }
//}
//
//
//}
//} 
//    
