//
//  PostsConfigurator.swift
//  deviget
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation
import devigetModule

class PostsConfigurator:PostsConfiguratorDelegate {
    
    static func configure(view: PostsViewDelegate?) {
        //configure MVP
        let remoteRepository = PostsRepositoryRemote.getInstace(with: Util.createPostsUrl(after: nil))
        let repository = PostsRepository.getInstace(withRemoteRepository: remoteRepository)
        let dataManager = DataManager()
        dataManager.setJsonFileNameToSuccess("entries_success_ok")
        repository?.setDataManager(dataManager)
        let presenter = PostsPresenter.getInstace(with: repository, viewDelegate: view)
        view?.setPresenter(presenter)
    }
    
    static func setNewURL(_ url: String?) {
        PostsRepositoryRemote.updateUrl(url)
    }
    
    static func cleanAllSingletons() {
        PostsRepositoryRemote.destroyInstance()
        PostsRepository.destroyInstance()
        PostsPresenter.destroyInstance()
    }
    
    private init() {}
    
}
