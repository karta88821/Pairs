//
//  CountrySelectedViewController.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

class CountrySelectedViewController: UITableViewController {
    
    private let cellId = "cellId"
    private let headerId = "headerId"
    
    var countries = Country.acroddingCourtries()
    
    var didSelectedCountry: ((Country) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .darkBlue()
        tableView.register(CountrySelectedCell.self, forCellReuseIdentifier: cellId)
        tableView.register(CountrySelectedHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
    }
    
    private func getSectionData(with section: Int) -> [Country] {
        return countries[section].map{$0.value}.first!
    }
}

extension CountrySelectedViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSectionData(with: section).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CountrySelectedCell
        let country = getSectionData(with: indexPath.section)[indexPath.row]
        cell.setup(with: country)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! CountrySelectedHeader
        let number = countries[section].map{ $0.key }
        
        header.setup(with: number.first!)
        return header
    }
}

extension CountrySelectedViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let country = getSectionData(with: indexPath.section)[indexPath.row]
        didSelectedCountry?(country)
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

