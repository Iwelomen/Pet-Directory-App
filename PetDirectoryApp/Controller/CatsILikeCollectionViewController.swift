//
//  CatsILikeCollectionViewController.swift
//  PetDirectoryApp
//
//  Created by Decagon on 3/27/22.
//

import UIKit



class CatsILikeCollectionViewController: UIViewController {
    
    private let Identifier = "CatsILikeCollectionViewCell"
    
    @IBOutlet weak var catsILikeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        catsILikeCollectionView.dataSource = self
    }
    
}

extension CatsILikeCollectionViewController: UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatsILikeCollectionViewCell", for: indexPath) as! CatsILikeCollectionViewCell
        
        // Configure the cell
        cell.catILikeImageView.image = UIImage(named: "cat1")
        cell.nameLabel.text = "Abyssinian"
        cell.heartImageview.image = UIImage(named: "plainHeart")
        return cell
    }
}
