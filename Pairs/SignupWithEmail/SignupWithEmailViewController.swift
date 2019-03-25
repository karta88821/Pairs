//
//  SignupWithEmailViewController.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

class SignupWithEmailViewController: UIViewController {
    
    lazy var dismissButton: UIButton = {
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "請輸入電子郵件地址"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        return label
    }()
    
    let emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        let font: UIFont = .boldSystemFont(ofSize: 20)
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.font = font
        textField.attributedPlaceholder = NSAttributedString(string: "mail@example.com", attributes: [.foregroundColor: UIColor.middleGray(), .font: font])
        return textField
    }()
    
    let sepLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "將會從no-reply+tw@pairs.lv寄信至您的電子郵件郵件地址。\n請確認是否能接收來自no-reply+tw@pairs.lv的郵件"
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkBlue()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(dismissButton)
        dismissButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 24, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        view.addSubview(titleLabel)
        titleLabel.anchor(dismissButton.bottomAnchor, left: dismissButton.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 28, leftConstant: 0, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        view.addSubview(emailView)
        emailView.anchor(titleLabel.bottomAnchor, left: dismissButton.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
        emailView.addSubview(submitButton)
        submitButton.anchor(emailView.topAnchor, left: nil, bottom: emailView.bottomAnchor, right: emailView.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 44, heightConstant: 0)
        emailView.addSubview(emailTextField)
        emailTextField.anchor(emailView.topAnchor, left: emailView.leftAnchor, bottom: emailView.bottomAnchor, right: submitButton.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        emailTextField.addSubview(sepLineView)
        sepLineView.anchor(emailView.bottomAnchor, left: emailView.leftAnchor, bottom: nil, right: emailView.rightAnchor, topConstant: -6, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(emailView.bottomAnchor, left: emailView.leftAnchor, bottom: nil, right: emailView.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 100)
    }
    
    @objc func dismissPage() {
        MBProgressHUD.showAdded(to: view, animated: true)
        dismiss(animated: true, completion: nil)
        MBProgressHUD.hide(for: view, animated: true)
    }
}

