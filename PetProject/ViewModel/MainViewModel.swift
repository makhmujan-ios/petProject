//
//  MainViewModel.swift
//  PetProject
//
//  Created by Niyazov Makhmujan on 05.01.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success(data: MainModel)
    func failure(error: Error)
}

protocol MainViewModelProtocol: AnyObject {
    var mainModel: MainModel? { get set }
    init(
        view: MainViewProtocol,
        networkService: ServiceMangerProtocol
    )
    func getNews()
    func tapOnTheNews(results: NewsResults)
}

final class MainViewModel: MainViewModelProtocol {
    var mainModel: MainModel?
    weak var mainView: MainViewProtocol?
    let networkService: ServiceMangerProtocol!
    
    init(view: MainViewProtocol, networkService: ServiceMangerProtocol) {
        self.mainView = view
        self.networkService = networkService
    }
    
    func getNews() {
        networkService.fetchNews { [weak self] results in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch results {
                case .success(let mainNews):
                    self.mainModel = mainNews
                    self.mainView?.success(data: mainNews)
                case .failure(let error):
                    self.mainView?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheNews(results: NewsResults) {
        //
    }
    
}
