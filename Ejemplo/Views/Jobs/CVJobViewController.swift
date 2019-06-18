//
//  CVJobViewController.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit

class CVJobViewController: UITableViewController, JobDelegate{
    
    fileprivate let jobPresenter = CVJobPresenter.init(section: CVJob())
    fileprivate var job = CVJob()
    
    var urlLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityIdentifier = "JobTable"
        
        jobPresenter.addDelegate(self)
        jobPresenter.getSections(url: urlLink!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = false
    }
    
    // - MARK: TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.job.jobs?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CVConstants.CELL_IDENTIFIER.JOB_CELL.rawValue, for: indexPath) as! CVJobCell
        cell.job = self.job.jobs![indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // - MARK: Presenter Methods
    
    func setJobData(_ data: CVJob) {
        self.job = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setEmptyData(message: String) {
        DispatchQueue.main.async {
            CVAlertManger.init(view: self).showAlert(title: "Alerta", message: message)
        }
    }
}
