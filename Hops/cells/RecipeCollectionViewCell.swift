//
//  RecipeCollectionViewCell.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
      lazy var ImageView: UIImageView = {
            let recipesImages = UIImageView()
           // recipesImages.backgroundColor = .clear
            self.addSubview(recipesImages)
          //  recipesImages.translatesAutoresizingMaskIntoConstraints = false
            return recipesImages
        }()
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.adjustsFontSizeToFitWidth = true
            //label.backgroundColor = .white
            self.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var readyTimeLabel: UILabel = {
            let label = UILabel()
           // label.adjustsFontSizeToFitWidth = true
            self.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        lazy var ServingsLabel: UILabel = {
            let label = UILabel()
          //  label.adjustsFontSizeToFitWidth = true
           // label.backgroundColor = .white
            self.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //MARK: Constraints
        
       private func setImageConstraints() {
        ImageView.translatesAutoresizingMaskIntoConstraints = false
              NSLayoutConstraint.activate([
             ImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ImageView.centerYAnchor.constraint(equalTo: ImageView.centerYAnchor, constant: 100),
              ImageView.widthAnchor.constraint(equalToConstant: 350),
          ImageView.heightAnchor.constraint(equalToConstant: 200)
        ])

        }
        private func settitleNameConstraints() {
            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: self.ImageView.bottomAnchor, constant: 70),
                titleLabel.centerXAnchor.constraint(equalTo: self.ImageView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 350),
            titleLabel.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
        private func readyTimeLabelConstraints() {
            NSLayoutConstraint.activate([
                readyTimeLabel.centerXAnchor.constraint(equalTo: self.readyTimeLabel.centerXAnchor),
                readyTimeLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 55),
              readyTimeLabel.widthAnchor.constraint(equalToConstant: 350),
              readyTimeLabel.heightAnchor.constraint(equalToConstant: 60)

            ])
        }
        private func setServingsLabelConstrainst() {
            NSLayoutConstraint.activate([
                ServingsLabel.centerXAnchor.constraint(equalTo: self.ServingsLabel.centerXAnchor),
                ServingsLabel.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor, constant: 30),
                ServingsLabel.widthAnchor.constraint(equalToConstant: 350),
                ServingsLabel.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .clear
            setImageConstraints()
           settitleNameConstraints()
          setServingsLabelConstrainst()
          readyTimeLabelConstraints()
        }


        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
}
