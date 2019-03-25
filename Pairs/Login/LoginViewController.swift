//
//  LoginViewController.swift
//  Pairs
//
//  Created by liaoyuhao on 2019/3/25.
//  Copyright © 2019 liaoyuhao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        let image = UIImage(named: "couple")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let filterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.2)
        return view
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "pairs")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.alpha = 0
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "來自日本 全新愛情體驗"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    lazy var signupWithPhoneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .sapphireBlue()
        
        let title = NSAttributedString(string: "使用電話號碼註冊", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(navigateToSignupWithPhonePage(_:)), for: .touchUpInside)
        button.alpha = 0
        
        return button
    }()
    
    lazy var signupWithEmailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .sapphireBlue()
        
        let title = NSAttributedString(string: "用電子郵件登入", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(self.navigateToSignupWithEmailPage), for: .touchUpInside)
        button.alpha = 0
        
        return button
    }()
    
    lazy var signupWithFacebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .facebookBlue()
        
        let title = NSAttributedString(string: "使用Facebook註冊", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.alpha = 0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.logoImageView.alpha = 1
            self.titleLabel.alpha = 1
            self.signupWithPhoneButton.alpha = 1
            self.signupWithEmailButton.alpha = 1
            self.signupWithFacebookButton.alpha = 1
        }, completion: nil)
    }
    
    func setupViews() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(filterView)
        backgroundImage.fillSuperview()
        filterView.fillSuperview()
        
        let centerStackView = generatorCenterStackView(arrangedSubviews: [logoImageView, titleLabel])
        filterView.addSubview(centerStackView)
        centerStackView.anchorCenterXToSuperview()
        centerStackView.anchorCenterYToSuperview(constant: -100)
        centerStackView.anchor(widthConstant: 250, heightConstant: 130)
        
        let loginButtonStackView = UIStackView(arrangedSubviews: [signupWithPhoneButton, signupWithEmailButton, signupWithFacebookButton])
        loginButtonStackView.axis = .vertical
        loginButtonStackView.distribution = .fillEqually
        loginButtonStackView.spacing = 15
        view.addSubview(loginButtonStackView)
        loginButtonStackView.anchor(nil, left: filterView.leftAnchor, bottom: nil, right: filterView.rightAnchor, topConstant: 0, leftConstant: 24, bottomConstant: 0, rightConstant: 24, widthConstant: 0, heightConstant: 54 * 3 + 15 * 2)
        loginButtonStackView.anchorCenterYToSuperview(constant: 100)
    }
    
    func generatorCenterStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [logoImageView, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }
    
    @objc func navigateToSignupWithPhonePage(_ sender: Any) {
        MBProgressHUD.showAdded(to: view, animated: true)
        let signupWithPhoneViewController = SignupWithPhoneViewController()
        let navigationController = UINavigationController(rootViewController: signupWithPhoneViewController)
        present(navigationController, animated: true, completion: nil)
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    @objc func navigateToSignupWithEmailPage() {
        MBProgressHUD.showAdded(to: view, animated: true)
        let signupWithEmailViewController = SignupWithEmailViewController()
        present(signupWithEmailViewController, animated: true, completion: nil)
        MBProgressHUD.hide(for: view, animated: true)
    }
}
