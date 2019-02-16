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
    @IBOutlet private weak var hoursLabel: UILabel!
    
    //MARK:- internal func
    func configureCell(post:EntryReddit) {
        configureReadView(post.read)
        configureImage(url: post.thumbnail, name: post.id)
        configureHoursLabel(post.created_utc)
        
        authorLabel.text = post.author_fullname
        titlePost.text = post.title
        commentsLabel.text = "\(post.num_comments) comments"
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
    
    private func configureImage(url:String?, name:String?) {
        imagePost.layer.cornerRadius = imagePost.bounds.width / 2
        imagePost.layer.masksToBounds = true
        imagePost.image = nil
        DataManager.shared.downloadImage(from: url
            , name: name
            , completion: { [weak self] (image) in
                self?.imagePost.image = image
        })
    }
    
    private func configureHoursLabel(_ time:TimeInterval) {
        let dateCreated = Date(timeIntervalSince1970: time)
        let components = Calendar.current.dateComponents([.hour], from: dateCreated, to: Date())
        let text = "\(components.hour ?? 0) hours ago"
        hoursLabel.text = text
    }
}
