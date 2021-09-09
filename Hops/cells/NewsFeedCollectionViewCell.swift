//
//  NewsFeedCollectionViewCell.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit

class NewsFeedCollectionViewCell: UICollectionViewCell {
 
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Optima-BOld", size: 14)
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    lazy var publishedLabel: UILabel = {
          let label = UILabel()
         // label.adjustsFontSizeToFitWidth = true
         label.font = UIFont(name: "Optima-BOld", size: 12)
          self.addSubview(label)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    lazy var ImageView: UIImageView = {
           let recipesImages = UIImageView()
           self.addSubview(recipesImages)
           return recipesImages
       }()
    lazy var cartImageButton: UIButton = {
      let button = UIButton()
      button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.backgroundColor = .clear
      button.contentMode = .scaleAspectFit
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
  }()
    private func settitleNameConstraints() {
       NSLayoutConstraint.activate([
      titleLabel.bottomAnchor.constraint(equalTo: self.ImageView.bottomAnchor, constant: 70),
           titleLabel.centerXAnchor.constraint(equalTo: self.ImageView.centerXAnchor),
       titleLabel.widthAnchor.constraint(equalToConstant: 350),
       titleLabel.heightAnchor.constraint(equalToConstant: 20),
       
       publishedLabel.centerXAnchor.constraint(equalTo: self.publishedLabel.centerXAnchor),
           publishedLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 55),
         publishedLabel.widthAnchor.constraint(equalToConstant: 350),
         publishedLabel.heightAnchor.constraint(equalToConstant: 60),

       ])
   }
       private func setImageConstraints() {
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
       ImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      ImageView.centerYAnchor.constraint(equalTo: ImageView.centerYAnchor, constant: 100),
        ImageView.widthAnchor.constraint(equalToConstant: 350),
    ImageView.heightAnchor.constraint(equalToConstant: 200),

    cartImageButton.topAnchor.constraint(equalTo: self.ImageView.topAnchor, constant: -100),
           cartImageButton.trailingAnchor.constraint(equalTo: self.ImageView.trailingAnchor),
           cartImageButton.widthAnchor.constraint(equalToConstant: 80),
           cartImageButton.heightAnchor.constraint(equalToConstant: 80)
                ])

        }
    override init(frame: CGRect) {
         super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        settitleNameConstraints()
        setImageConstraints()
     }


     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
