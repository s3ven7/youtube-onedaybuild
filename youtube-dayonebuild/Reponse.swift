//
//  Response.swift
//  youtube-dayonebuild
//
//  Created by ASHIQUR RAHMAN on 11/7/21.
//

import Foundation
import CoreText

struct Response: Decodable {
    
    var items: [Video]?

    enum CodingKeys:String, CodingKey {
        
        case items
        
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
        
    }
    
}
