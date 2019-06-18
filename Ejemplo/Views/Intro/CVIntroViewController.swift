//
//  CVIntroViewController.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation
import UIKit


class CVIntroViewController: UITableViewController, SectionDelegate{
    
    fileprivate let sectionPresenter = CVIntroPresenter.init(section: CVSections())
    fileprivate var sections = CVSections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the custom header for the tableview
        let header = CVHeaderView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        self.tableView.tableHeaderView = header
        self.tableView.accessibilityIdentifier = "IntroTable"
        sectionPresenter.addDelegate(self)
        sectionPresenter.getSections()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Hide the navigation bar
        self.navigationController!.navigationBar.isHidden = true
    }
    
    // - MARK: TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.sections.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CVConstants.CELL_IDENTIFIER.SECTION_CELL.rawValue, for: indexPath) as! CVIntroCell
        cell.section = self.sections.sections![indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sect = self.sections.sections![indexPath.row]
        switch sect.nameSection {
        case CVConstants.WAY_VALUE.USER_INFO.rawValue:
            self.performSegue(withIdentifier: CVConstants.SEGUE_VALUES.USER_VALUE.rawValue, sender: sect.sectionURL)
            break
        default:
            self.performSegue(withIdentifier: CVConstants.SEGUE_VALUES.JOB_VALUE.rawValue, sender: sect.sectionURL)
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        if (vc as? CVUserViewController) != nil{
            (vc as? CVUserViewController)?.urlLink = sender as? String
        }else{
            (vc as? CVJobViewController)?.urlLink = sender as? String
        }
    }
    
    // - MARK: Presenter Methods
    
    func setSectionData(_ data: CVSections) {
        self.sections = data
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
