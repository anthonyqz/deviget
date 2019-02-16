//
//  EntryReddit.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

public struct EntryReddit:Decodable{
    public var read:Bool?
    public let subreddit:String?
    public let thumbnail:String?
    public let title:String?
    public let num_comments:Int
    public let created_utc:TimeInterval
    public let url:String?
    public let author_fullname:String?
    public let id:String?
}
