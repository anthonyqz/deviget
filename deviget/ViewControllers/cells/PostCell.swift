//
//  PostCell.swift
//  deviget
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import UIKit
import devigetModule

class PostCell: UITableViewCell {

    //MARK:- static properties
    static let identifierView = "PostCell"
    
    //MARK:- IBOutlet properties
    @IBOutlet private weak var readView: UIView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var imagePost: UIImageView!
    @IBOutlet private weak var titlePost: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    
    //MARK:- internal func
    func configureCell(post:EntryReddit) {
        configureReadView(post.read)
        configureImage(url: post.thumbnail)
        
        titlePost.text = post.title
        authorLabel.text = post.author_fullname
    }

    //MARK:- private func
    private func configureReadView(_ read:Bool?) {
        let read = read ?? false
        if read {
            readView.isHidden = true
            return
        }
        readView.isHidden = false
        readView.layer.cornerRadius = readView.bounds.width / 2
        readView.layer.masksToBounds = true
    }
    
    private func configureImage(url:String?) {
        imagePost.layer.cornerRadius = imagePost.bounds.width / 2
        imagePost.layer.masksToBounds = true
    }
}
