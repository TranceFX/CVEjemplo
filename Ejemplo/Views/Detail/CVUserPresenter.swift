//
//  CVUserPresenter.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

protocol UserDelegate:class {
    func setUserData(_ data: CVUser)
    func setEmptyData(message: String)
}

class CVUserPresenter{
    
    fileprivate let users: CVUser
    fileprivate weak var userDelegate: UserDelegate?
    
    init(user: CVUser) {
        self.users = user
    }
    
    func addDelegate(_ delegate: UserDelegate){
        userDelegate = delegate
    }
    
    func getUserInfo(urlInfo: String){
        
        CVLoaderView.show()
        
        ServiceManager.sharedInstance.getDataFromURL(urlString: urlInfo, completion: {[weak self] (response: CVUser?, error: String?) in
            
            CVLoaderView.dismiss()
            
            guard let strongSelf = self else { return }
            
            guard let response = response, error == nil else {
                strongSelf.userDelegate?.setEmptyData(message: error!)
                return
            }
            
            strongSelf.userDelegate?.setUserData(response)
            
        })
    }
}
