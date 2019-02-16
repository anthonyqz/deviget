//
//  Util.swift
//  deviget
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

class Util {
    
    static func createPostsUrl(after:String?) -> String {
        let after = after ?? ""
        return endpoint.replacingOccurrences(of: keyAfter, with: after)
    }
    
}
