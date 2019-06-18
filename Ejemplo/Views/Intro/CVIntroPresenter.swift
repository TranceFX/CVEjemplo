//
//  CVIntroPresenter.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

protocol SectionDelegate:class {
    func setSectionData(_ data: CVSections)
    func setEmptyData(message: String)
}

class CVIntroPresenter{
    
    fileprivate let sections: CVSections
    fileprivate weak var sectionDelegate: SectionDelegate?
    
    init(section: CVSections) {
        self.sections = section
    }
    
    func addDelegate(_ delegate: SectionDelegate){
        sectionDelegate = delegate
    }
    
    func getSections(){
        
        CVLoaderView.show()
        
        if CVConstants.API_URL.ENDPOINT.count != 0{
            ServiceManager.sharedInstance.getDataFromURL(urlString: CVConstants.API_URL.ENDPOINT, completion: {[weak self] (response: CVSections?, error: String?) in
                
                CVLoaderView.dismiss()
                
                guard let strongSelf = self else { return }
                
                guard let response = response, error == nil else {
                    strongSelf.sectionDelegate?.setEmptyData(message: error!)
                    return
                }
                
                strongSelf.sectionDelegate?.setSectionData(response)
                
            })
        }else{
            self.sectionDelegate?.setEmptyData(message: Errors.invalidPLIST)
        }
    }
}
