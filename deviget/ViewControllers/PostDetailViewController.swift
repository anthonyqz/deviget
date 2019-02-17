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

    //MARK:- internal properties
    var post:EntryReddit?
    
    //MARK:- IBOutlet properties
    @IBOutlet private weak var detailDescriptionLabel: UITextView!
    @IBOutlet private weak var imagePost: UIImageView!
    
    //MARK:- UIViewController
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailDescriptionLabel.text = post?.title
        DataManager.shared.downloadImage(from: post?.thumbnail, name: post?.id) { [weak self] (image) in
            self?.imagePost.image = image
        }
    }
    
    @IBAction func sendImage() {
        guard let image = imagePost.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    

}

