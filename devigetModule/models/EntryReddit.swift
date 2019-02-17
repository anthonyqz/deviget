//
//  EntryReddit.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

public struct EntryReddit:Codable {
    
    public var read:Bool?
    public let subreddit:String?
    public let thumbnail:String?
    public let title:String?
    public let num_comments:Int
    public let created_utc:TimeInterval
    public let url:String?
    public let author_fullname:String?
    public let id:String?
    
    enum CodingKeys: String, CodingKey {
        case read
        case subreddit
        case thumbnail
        case title
        case num_comments
        case created_utc
        case url
        case author_fullname
        case id
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        read = try? container.decode(Bool.self, forKey: .read)
        subreddit = try? container.decode(String.self, forKey: .subreddit)
        thumbnail = try? container.decode(String.self, forKey: .thumbnail)
        title = try? container.decode(String.self, forKey: .title)
        num_comments = try container.decode(Int.self, forKey: .num_comments)
        created_utc = try container.decode(TimeInterval.self, forKey: .created_utc)
        url = try? container.decode(String.self, forKey: .url)
        author_fullname = try? container.decode(String.self, forKey: .author_fullname)
        id = try? container.decode(String.self, forKey: .id)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(read, forKey: .read)
        try container.encode(subreddit, forKey: .subreddit)
        try container.encode(thumbnail, forKey: .thumbnail)
        try container.encode(title, forKey: .title)
        try container.encode(num_comments, forKey: .num_comments)
        try container.encode(created_utc, forKey: .created_utc)
        try container.encode(url, forKey: .url)
        try container.encode(author_fullname, forKey: .author_fullname)
        try container.encode(id, forKey: .id)
    }
}
