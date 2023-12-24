//
//  HeroesCollectionViewController.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. 
//

import UIKit


@available(iOS 13.0, *)
final class HeroesCollectionViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    private var superheroes: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Choose Your Hero"
    }
    
    // MARK: UICollectionViewDataSource
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
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardVC = storyboard?.instantiateViewController(identifier: "HeroCardVC") as! HeroCardVC
        cardVC.superHero = superheroes[indexPath.item]
        cardVC.navigationItem.title = superheroes[indexPath.item].name
        self.navigationController?.pushViewController(cardVC, animated: true)
    }
}
//MARK: - Networking
@available(iOS 13.0, *)
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

