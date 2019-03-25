//
//  CountrySelectedHeader.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

class CountrySelectedHeader: UITableViewHeaderFooterView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var number: Int?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundView = UIView(frame: bounds)
        backgroundView?.backgroundColor = .minDarkBlue()
        backgroundView?.addSubview(titleLabel)
        
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 0, widthConstant: 150, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with number: Int) {
        self.number = number
        self.titleLabel.attributedText = NSAttributedString(string: "\(number)" + " 畫", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 18, weight: .bold)])
    }
}
