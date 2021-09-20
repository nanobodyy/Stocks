//
//  PopularPresenter.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import UIKit
import Kingfisher


class PopularPresenter: PopularPresenterProtocol {
    weak var view: PopularViewControllerProtocol?
    var iteractor: PopularIteractorProtocol?
    
    var companies = [Stocks]()
    
    func viewLoad() {
        iteractor?.startFetch()
        print(1)
    }
    
    func fillData(with company: Stocks) {
        companies.append(company)
        //print(company)
        view?.reloadView()
    }
    
    
}
