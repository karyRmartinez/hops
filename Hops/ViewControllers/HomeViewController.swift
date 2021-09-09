//
//  ViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/15/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.backgroundColor = .white
         label.textAlignment = .center
         label.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
         label.text = "HOPS 2.0"
         label.font = UIFont(name: "Optima-BOld", size: 45)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var imageViewSet : UIImageView = {
    let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.animationImages = [
        UIImage(named:"ImageBunnyEars2" )!,
        UIImage(named:"ImageEars")!
        ]
        image.animationDuration = 1
        return image
   
       }()
 
    lazy var loginButton: UIButton = {
          let button = UIButton()
          button.setTitle("Hop On", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
          button.translatesAutoresizingMaskIntoConstraints = false
          button.layer.cornerRadius = 12
         button.addTarget(self, action: #selector(self.startButtonPressed(sender:)), for: .touchUpInside)
          return button
      }()
    lazy var LoginTextField: UITextField = {
         let textField = UITextField()
         textField .translatesAutoresizingMaskIntoConstraints = false
         textField .placeholder = "Email"
         textField .borderStyle = .none
         textField .backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         textField.layer.borderColor = UIColor.black.cgColor
         return textField
         
     }()
     
     lazy var passwordTextField: UITextField = {
         let pstextField = UITextField()
         pstextField.translatesAutoresizingMaskIntoConstraints = false
         pstextField.textColor = .black
         pstextField.isSecureTextEntry = true
         pstextField.placeholder = "Password"
         pstextField.borderStyle = .none
         pstextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         return pstextField
     }()
    
    @objc func startButtonPressed(sender: UIButton) {
    //self.animateView(sender)
    self.navigationController?.pushViewController(MainTabBarViewController(), animated: true)
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        view.backgroundColor = .white
        imageViewSet.startAnimating()
        addSubviews()
        setupLoginStackView()
        settingUpConstraints()

    }
    private func addSubviews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(imageViewSet)
        self.view.addSubview(loginButton)
        self.view.addSubview(LoginTextField)
        self.view.addSubview(passwordTextField)
    }
    private func settingUpConstraints() {
        NSLayoutConstraint.activate([
    
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        imageViewSet.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
        imageViewSet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageViewSet.widthAnchor.constraint(equalToConstant: 100),
        imageViewSet.heightAnchor.constraint(equalToConstant: 100),
        
       loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
       loginButton.widthAnchor.constraint(equalToConstant: 140),
       loginButton.heightAnchor.constraint(equalToConstant: 35),
                   
        ])
    }
    private func setupLoginStackView() {
         let stackView = UIStackView(arrangedSubviews: [LoginTextField, passwordTextField])
         stackView.axis = .vertical
         stackView.spacing = 15
         stackView.distribution = .fillEqually
         self.view.addSubview(stackView)
         
         stackView.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([stackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -50),
             stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
             stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
         stackView.heightAnchor.constraint(equalToConstant: 130)])
     }

}

