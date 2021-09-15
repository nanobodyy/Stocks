//
//  PopularPresenter.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation


class PopularPresenter: PopularPresenterProtocol {
    weak var view: PopularViewControllerProtocol?
    var iteractor: PopularIteractorProtocol?
    
    var companies: (([Company]) -> Void)?
    
    func viewLoad() {
        iteractor?.startFetch(complition: { (companiesList) in
            self.companies?(companiesList)
        })
    }
    
}
