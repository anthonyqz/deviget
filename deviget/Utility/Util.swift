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
    
    //MARK:- FileManager
    class func write(data:Data?, withName name:String?) {
        guard let data = data, let name = name else { return }
        if let pathCache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
            let url = URL(fileURLWithPath: pathCache).appendingPathComponent(name)
            do {
                try data.write(to: url)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    class func readData(withName name:String?) -> Data? {
        guard let name = name else { return nil }
        if let pathCache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
            let url = URL(fileURLWithPath: pathCache).appendingPathComponent(name)
            if let data = try? Data(contentsOf: url) {
                return data
            }
        }
        return nil
    }
    
}
