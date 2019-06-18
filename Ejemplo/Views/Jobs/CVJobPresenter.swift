//
//  CVJobPresenter.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

protocol JobDelegate:class {
    func setJobData(_ data: CVJob)
    func setEmptyData(message: String)
}

class CVJobPresenter{
    
    fileprivate let sections: CVJob
    fileprivate weak var jobDelegate: JobDelegate?
    
    init(section: CVJob) {
        self.sections = section
    }
    
    func addDelegate(_ delegate: JobDelegate){
        jobDelegate = delegate
    }
    
    func getSections(url: String){
        
        CVLoaderView.show()
        
        ServiceManager.sharedInstance.getDataFromURL(urlString: url, completion: {[weak self] (response: CVJob?, error: String?) in
            
            CVLoaderView.dismiss()
            
            guard let strongSelf = self else { return }
            
            guard let response = response, error == nil else {
                strongSelf.jobDelegate?.setEmptyData(message: error!)
                return
            }
            
            strongSelf.jobDelegate?.setJobData(response)
        })
    }
}

