//
//  CVUserDetail.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

class CVUserViewController: UIViewController, UserDelegate {
    
    @IBOutlet private weak var nameInfo: UILabel?
    @IBOutlet private weak var birthInfo: UILabel?
    @IBOutlet private weak var cityInfo: UILabel?
    @IBOutlet private weak var stateInfo: UILabel?
    @IBOutlet private weak var codeInfo: UILabel?
    @IBOutlet private weak var streetInfo: UILabel?
    @IBOutlet private weak var mailInfo: UILabel?
    @IBOutlet private weak var phoneInfo: UILabel?
    @IBOutlet private weak var basicInfo: UILabel?
    @IBOutlet private weak var advInfo: UILabel?
    @IBOutlet private weak var profilePicture: UIImageView?
    @IBOutlet private weak var scrollUser: UIScrollView?
    
    var urlLink: String?
    
    fileprivate let userPresenter = CVUserPresenter.init(user: CVUser())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollUser?.accessibilityIdentifier = "UserView"
        
        userPresenter.addDelegate(self)
        userPresenter.getUserInfo(urlInfo: urlLink!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = false
    }
    
    // - MARK: Presenter Methods
    
    func setUserData(_ data: CVUser) {
        DispatchQueue.main.async {
            self.nameInfo?.text = "\(data.name ?? "") \(data.lastName ?? "")"
            self.birthInfo?.text = data.birthDay ?? ""
            self.cityInfo?.text = data.address?.city ?? ""
            self.stateInfo?.text = data.address?.state ?? ""
            self.streetInfo?.text = data.address?.streetAddress ?? ""
            self.mailInfo?.text = data.contact?.email ?? ""
            let cp = data.address?.cpCode ?? 0
            self.codeInfo?.text = String(describing: cp)
            let number = data.contact?.phoneNumber ?? 0
            self.phoneInfo?.text = String(number)
            self.basicInfo?.text = data.skills?.basic?.joined(separator: "/n")
            self.advInfo?.text = data.skills?.advanced?.joined(separator: "/n")
            self.profilePicture?.getImageFrom(urlLink: data.profileImage)
        }
    }
    
    func setEmptyData(message: String) {
        DispatchQueue.main.async {
            CVAlertManger.init(view: self).showAlert(title: "Alerta", message: message)
        }
    }
}
