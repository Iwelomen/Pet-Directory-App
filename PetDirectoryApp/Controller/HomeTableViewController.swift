//
//  HomeTableViewController.swift
//  PetDirectoryApp
//
//  Created by Decagon on 3/25/22.


import UIKit



class HomeTableViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let apiService: ApiService = ApiService.sharedInstance
    var cats = [AllCat]() {
        didSet{
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }
    
    func getCatData() {
        apiService.getCats { [weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case.success(let catsData):
                self?.cats = catsData
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCatData()
        homeTableView.dataSource = self
    }
    
    
    
    
}

extension HomeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatsTableViewCell.reuseIdentifier, for: indexPath) as! CatsTableViewCell
        
        let cat = cats[indexPath.row]
        
        cell.catNameLabel.text = cat.name
        DispatchQueue.main.async {
            let imageProvider = ImageProvider()
            imageProvider.requestImage(from: URL(string: cat.image?.url ?? "Cat1")!) { image in
                cell.catImageView.image = image
            }
        }
        return cell
    }
}
