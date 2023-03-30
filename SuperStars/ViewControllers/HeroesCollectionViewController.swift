//
//  HeroesCollectionViewController.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 30/03/23.
//

import UIKit


final class HeroesCollectionViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    private var superheroes: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
}
//MARK: - Networking
private extension HeroesCollectionViewController {
    func fetchData() {
        networkManager.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                self?.superheroes = data
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension HeroesCollectionViewController {
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return superheroes.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hero", for: indexPath) as! HeroCell
        let hero = superheroes[indexPath.row]
        cell.configure(superhero: hero)
        
    
        // Configure the cell
    
        return cell
    }
}
