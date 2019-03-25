//
//  CountrySelectedCell.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

class CountrySelectedCell: UITableViewCell {
    
    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    let countryCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    var country: Country?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkBlue()
        
        addSubview(countryNameLabel)
        addSubview(countryCodeLabel)
        countryNameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 0, widthConstant: 100, heightConstant: 0)
        countryCodeLabel.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 16, widthConstant: 100, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with country: Country) {
        self.country = country
        self.countryNameLabel.text = country.rawValue
        self.countryCodeLabel.text = country.code
    }
}
