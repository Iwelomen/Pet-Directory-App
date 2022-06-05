//
//  CatsTableViewCell.swift
//  PetDirectoryApp
//
//  Created by Decagon on 3/26/22.
//

import UIKit

class CatsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CatsTableViewCell"
    
    @IBOutlet weak var catImageView: UIImageView!
    
    @IBOutlet weak var catNameLabel: UILabel!
    
    @IBOutlet weak var favouriteButton: UIButton!
}
