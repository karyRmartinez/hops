//
//  BeautyCollectionViewCell.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit

class BeautyCollectionViewCell: UICollectionViewCell {
    
      lazy var imageView: UIImageView = {
          let  Image = UIImageView()
        self.addSubview(Image)
          Image.translatesAutoresizingMaskIntoConstraints = false
          return Image
      }()
      
      
      lazy var MakeupLabel: UILabel = {

          let label = UILabel()
          label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
          self.addSubview(label)
         label.translatesAutoresizingMaskIntoConstraints = false

          return label
      }()
      
      func setImage() {
      NSLayoutConstraint.activate([
                   imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                   imageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 300),
                 imageView.widthAnchor.constraint(equalToConstant: 350),
                 imageView.heightAnchor.constraint(equalToConstant: 250),

               ])
          
      }
      
      
      func setlabel() {
          NSLayoutConstraint.activate([
      MakeupLabel.centerXAnchor.constraint(equalTo: MakeupLabel.centerXAnchor),
    MakeupLabel.centerYAnchor.constraint(equalTo: MakeupLabel.centerYAnchor, constant: -250),
    MakeupLabel.widthAnchor.constraint(equalToConstant: 100),
  MakeupLabel.heightAnchor.constraint(equalToConstant: 100)
          ])
          
      }
   
      override init(frame: CGRect) {
          super.init(frame: frame)
        backgroundColor = .orange
          setImage()
          setlabel()
          
          
      }
      
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
