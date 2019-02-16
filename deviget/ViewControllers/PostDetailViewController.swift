//
//  PostDetailViewController.swift
//  deviget
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import UIKit
import devigetModule

class PostDetailViewController: UIViewController {

    var post:EntryReddit? {
        didSet {
            self.detailDescriptionLabel.text = post?.title
        }
    }
    
    @IBOutlet private weak var detailDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

