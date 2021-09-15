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
    
    var companies = [Company]()
    
    func viewLoad(compliton: @escaping () -> Void) {
        iteractor?.startFetch()
    }
    
    func fillData(with company: Company) {
        companies.append(company)
        view?.reloadView()
    }
    
}
