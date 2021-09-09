//
//  FeedCollectionViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/15/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
private let apiClient = NewsAPIManager()
    
    var allNews = [Article]() {
          didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
          }
      }
    }
  lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 400)
        let newsFeedView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        newsFeedView.register(NewsFeedCollectionViewCell.self, forCellWithReuseIdentifier: "theCell")
    newsFeedView.backgroundColor = .white
        return newsFeedView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      // Do any additional setup after loading the view.
        view.backgroundColor = .white
       collectionView.delegate = self
      collectionView.dataSource = self
        NavigationBarTitle()
        addSubview()
      loadAPIData()
        collectionViewConstraints()
    }
    //MARK: addSubViews
     
     func addSubview() {
         self.view.addSubview(collectionView)
     }
    //MARK: Private Functions
    private func loadAPIData() {
        apiClient.getNews { [weak self] (result) in
            switch result {
            case .failure(let error):
              print(error)
            case .success(let newsonline):
                self?.allNews = newsonline
                dump(newsonline)
            }
          }
      }
private func NavigationBarTitle() {
       self.title = " News "
    view.tintColor = .systemGreen
   }
private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
     }
    
    
}
//MARK: Extensions
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = allNews[indexPath.row]
        let detailViewController = DetailViewController()
        //detailViewController.currentNews = selectedRecipe
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath) as! NewsFeedCollectionViewCell
        let currentNewsFeed = allNews[indexPath.row]
        cell.titleLabel.text = currentNewsFeed.title
        cell.publishedLabel.text = currentNewsFeed.author

        ImageHelper.shared.fetchImage(urlString: currentNewsFeed.urlToImage!) { (result) in
               DispatchQueue.main.async {
                   switch result {
                   case .failure(let error):
                       print(error)
                   case .success(let imageFromOnline):
                    cell.ImageView.image = imageFromOnline
                   }
               }
           }
        return cell
    }
    
    
}
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collctionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 350)
    }
}
