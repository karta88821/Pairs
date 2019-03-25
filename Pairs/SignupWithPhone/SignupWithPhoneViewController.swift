//
//  SignupWithPhoneViewController.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

class SignupWithPhoneViewController: UIViewController {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "輸入手機號碼"
        label.textColor = .middleGray()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let phoneView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var countryButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: countury.code, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 18, weight: .heavy)]), for: .normal)
        button.backgroundColor = .minDarkBlue()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(navigationToCountrySelectedPage), for: .touchUpInside)
        return button
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .minDarkBlue()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        textField.keyboardType = .phonePad
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        let title = NSAttributedString(string: "下一步", attributes: [.foregroundColor: UIColor.darkBlue()])
        button.setAttributedTitle(title, for: .normal)
        button.backgroundColor = .minDarkBlue()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return button
    }()
    
    var countury: Country = .taiwan
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkBlue()
        setupNavigationController()
        setupViews()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    func setupNavigationController() {
        let leftBarItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(naviationToLoginPage))
        leftBarItem.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarItem
        
        navigationController?.navigationBar.barTintColor = .darkBlue()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "登入APP"
    }
    
    func setupViews() {
        view.addSubview(descriptionLabel)
        descriptionLabel.anchorCenterXToSuperview()
        descriptionLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 50)
        
        let stackView = generateStackView()
        view.addSubview(stackView)
        stackView.anchor(descriptionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 24, leftConstant: 24, bottomConstant: 0, rightConstant: 24, widthConstant: 0, heightConstant: 60 * 2 + 10)
        
        phoneView.addSubview(countryButton)
        phoneView.addSubview(phoneTextField)
        countryButton.anchor(phoneView.topAnchor, left: phoneView.leftAnchor, bottom: phoneView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 0)
        phoneTextField.anchor(phoneView.topAnchor, left: countryButton.rightAnchor, bottom: phoneView.bottomAnchor, right: phoneView.rightAnchor, topConstant: 0, leftConstant: 24, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func generateStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [phoneView, nextButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }
    
    @objc func naviationToLoginPage() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldEditingChanged() {
        let isFillin = phoneTextField.text?.count ?? 0 > 0
        let titleColor: UIColor = isFillin ? UIColor.darkText : .darkBlue()
        let backgroundColor: UIColor = isFillin ? .white : .minDarkBlue()
        
        nextButton.isEnabled = isFillin
        nextButton.setAttributedTitle(NSAttributedString(string: "下一步", attributes: [.foregroundColor: titleColor]), for: .normal)
        nextButton.backgroundColor = backgroundColor
    }
    
    @objc func nextAction() {
        guard let phoneNumber = phoneTextField.text else { return }
        
        guard !(phoneNumber.count < 10) else {
            showAlertIn(self, title: "號碼太短")
            return
        }
        guard !(phoneNumber.count > 10) else {
            showAlertIn(self, title: "號碼太長")
            return
        }
        view.endEditing(true)
        showAlertIn(self, title: "成功！\n \(phoneNumber)")
    }
    
    func didSelectedCountry(country: Country) {
        self.countury = country
        countryButton.setAttributedTitle(NSAttributedString(string: countury.code, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 18, weight: .heavy)]), for: .normal)
    }
    
    @objc func navigationToCountrySelectedPage() {
        let countrySelectedViewController = CountrySelectedViewController(style: .plain)
        countrySelectedViewController.didSelectedCountry = didSelectedCountry
        navigationController?.pushViewController(countrySelectedViewController, animated: true)
    }
}

