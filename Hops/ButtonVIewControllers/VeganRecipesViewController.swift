//
//  VeganRecipesViewController.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import UIKit

class VeganRecipesViewController: UIViewController {

        
        var allRecipes = [AllResults]() {
            didSet {
                collectionView.reloadData()
            }
        }
        
        
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 0
            layout.itemSize = CGSize(width: view.frame.width, height: 400)
            let BrowserView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            
            BrowserView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: "theCell")
            BrowserView.backgroundColor = .white
              BrowserView.dataSource = self
            BrowserView.delegate = self
            return BrowserView
        }()
        
        lazy var searchBar: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.searchBarStyle = UISearchBar.Style.prominent
            searchBar.placeholder = "Recipes waiting here.."
            searchBar.sizeToFit()
            searchBar.isTranslucent = true
            searchBar.backgroundImage = UIImage()
           searchBar.delegate = self
            return searchBar
        }()
      
        //MARK: addSubViews
        
        func addSubview() {
            self.view.addSubview(collectionView)
            self.view.addSubview(searchBar)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            collectionView.delegate = self
            collectionView.dataSource = self
            NavigationBarTitle()
            addSubview()
           // loadAPIData()
            collectionViewConstraints()
            SearchBarConstraints()
            
            
            // Do any additional setup after loading the view.
        }
        
        //MARK: Private Functions
        private func loadAPIData(searchQuery: String) {
            RecipesAPIManager.manager.getRecipes(searchString: searchQuery)
            { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let dataFromOnline):
                        self.allRecipes = dataFromOnline
                        dump(dataFromOnline)
                    case.failure(let error):
                        print(error)
                    }
                }
            }
        }
        
        private func NavigationBarTitle() {
            self.title = "Vegan Recipes"
        }
        //MARK: Constraints
        
        private func collectionViewConstraints() {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        }
        private func SearchBarConstraints() {
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                searchBar.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    }
    //MARK: Extensions

    extension VeganRecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return allRecipes.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath) as! RecipeCollectionViewCell
            let currentRecipe = allRecipes[indexPath.row]
            cell.readyTimeLabel.text = " Ready in \(currentRecipe.readyInMinutes) minutes"
                
            cell.ServingsLabel.text = "Recipe serves \(currentRecipe.servings)"
            
         let imageURL = URL(string: currentRecipe.image)
            ImageHelper.shared.fetchImage(urlString: "https://spoonacular.com/recipeImages/\(currentRecipe.image)") { (result) in
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

    extension VeganRecipesViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collctionViewLayout: UICollectionViewLayout, sizeForItemAt
            indexPath: IndexPath) -> CGSize {
            return CGSize(width: 350, height: 350)
        }
    }
    extension VeganRecipesViewController: UISearchBarDelegate {
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            loadAPIData(searchQuery: searchBar.text ?? "")



}
}
