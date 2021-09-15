//
//  PopularContainer.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation
import Swinject

class PopularContainer {
    
    private let container = Container()
    
    func register() {
        container.register(PopularViewController.self) { (resolver) -> PopularViewController in
            let vc = PopularViewController()
            vc.presenter = resolver.resolve(PopularPresenterProtocol.self)
            return vc
        }.implements(PopularViewControllerProtocol.self )
        
        container.register(PopularPresenter.self) { (resolver) -> PopularPresenter in
            let presenter = PopularPresenter()
            presenter.iteractor = resolver.resolve(PopularIteractorProtocol.self)
            return presenter
        }.implements(PopularPresenterProtocol.self )
        .initCompleted { (resolver, presenter) in
            presenter.view = resolver.resolve(PopularViewControllerProtocol.self)
        }
        
        container.register(PopularIteractor.self) { (resolver) -> PopularIteractor in
            let iteractor = PopularIteractor()
            return iteractor
        }.implements(PopularIteractorProtocol.self)
        .initCompleted { (resolver, iteractor) in
            iteractor.presenter = resolver.resolve(PopularPresenterProtocol.self)
        }
    }
    
    func fetchViewController() -> UIViewController? {
        return container.resolve(PopularViewController.self)
    }
}
