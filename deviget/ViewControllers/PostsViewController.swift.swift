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
    private let sectionPosts    = 0
    private let sectionLoadMore = 1
    private var isLoadingPosts = false
    weak private var presenter:PostsPresenterDelegate?

    //MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableView.automaticDimension
        PostsConfigurator.configure(view: self)//create MVP
        isLoadingPosts = true
        presenter?.loadPosts()
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - IBAction
    @IBAction private func refreshView(_ sender: UIRefreshControl) {
        posts = []
        tableView.reloadData()
        refreshControl?.endRefreshing()
        loadPosts(with: nil)
    }
    
    // MARK: - private func
    private func loadPosts(with after:String?) {
        PostsConfigurator.setNewURL(Util.createPostsUrl(after: after))
        isLoadingPosts = true
        presenter?.loadPosts()
    }
}

//MARK:- Table View
extension PostsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == sectionLoadMore ? 1 : posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == sectionLoadMore {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath)
            let activityIndicator = cell.viewWithTag(1) as? UIActivityIndicatorView
            activityIndicator?.startAnimating()
            return cell
        }
        
        let post = posts[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifierView, for: indexPath) as! PostCell
        cell.configureCell(post: post, delegate: self)
        return cell
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard !isLoadingPosts else { return }
        //validate if is the last row
        let visibleIndex = tableView.indexPathsForVisibleRows ?? []
        let total = posts.count - 1
        let contain = visibleIndex.contains { (indexPath) -> Bool in
            indexPath.row >= total ? true : false
        }
        if contain {
            loadPosts(with: afterPostString)
        }
    }
}

// MARK: - PostCellDelegate
extension PostsViewController:PostCellDelegate {
    
    func dismissPost(with id: String?) {
        //get indexPath
        if let row = posts.firstIndex(where: { $0.id == id }) {
            posts.remove(at: row)
            let indexPath = IndexPath(row: row, section: sectionPosts)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}

// MARK: - PostsViewDelegate
extension PostsViewController:PostsViewDelegate {
    
    func showEntries(_ entries: [EntryReddit]) {
        isLoadingPosts = false
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
        isLoadingPosts = false
    }
    
}
