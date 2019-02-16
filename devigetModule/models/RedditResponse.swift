//
//  RedditResponse.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation


struct RedditResponse:Decodable {
    let kind:String?
    let data:DataResponse?
}
