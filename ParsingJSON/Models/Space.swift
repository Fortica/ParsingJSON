//
//  Space.swift
//  ParsingJSON
//
//  Created by Larisa on 03.05.2021.
//

import Foundation

struct Space: Decodable {
    let date: String?
    let explanation: String?
    let title: String?
    let url: String?
    
    init(spaceData: [String: Any]) {
        date = spaceData["date"] as? String
        explanation = spaceData["explanation"] as? String
        title = spaceData["title"] as? String
        url = spaceData["url"] as? String
    }
}


enum URLApi: String {
    case json = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2019-03-17"
}


