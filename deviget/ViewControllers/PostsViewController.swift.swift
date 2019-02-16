//
//  PostsViewController.swift
//  deviget
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import UIKit
import devigetModule

class PostsViewController: UITableViewController {

    //MARK:- privates properties
    private var posts = [EntryReddit]()
    private var afterPostString:String?
    weak private var presenter:PostsPresenterDelegate?

    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        PostsConfigurator.configure(view: self)//create MVP
        presenter?.loadPosts()
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }

}
// MARK: - PostsViewDelegate
extension PostsViewController:PostsViewDelegate {
    
    func showEntries(_ entries: [EntryReddit]) {
        posts.append(contentsOf: entries)
        tableView.reloadData()
    }
    
    func sendAfterPost(_ after: String?) {
        afterPostString = after
    }
    
    func setPresenter(_ presenter: PostsPresenterDelegate?) {
        self.presenter = presenter
    }
    
    func showNetworkError(_ error: Error?) {
        
    }
    
}
