//
//  SwiftModel.swift
//  swiftyJSON
//
//  Created by MAC on 19/12/20.
//

import Foundation


struct JsonData:Decodable {
    var artistID:Int?
    var artistName:String = ""
    var trackName:String = ""
    var trackCensoredName:String = ""
    var artworkUrl100:String = ""
    
    init(){
        
    }
    
    init(json:JSON) {
        artistID = json["artistID"].intValue
        artistName = json["artistName"].stringValue
        trackName = json["trackName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
    }
}
