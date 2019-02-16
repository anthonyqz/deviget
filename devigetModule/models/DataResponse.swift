//
//  DataResponse.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

 struct DataResponse:Decodable {
    let modhash:String?
    let dist:Int
    let after:String?
    let before:String?
    let children:[ChildrenResponse]?
}
