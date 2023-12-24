//
//  HeroListVC.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur Mamashayev on 24/12/2023.
//

import UIKit

final class HeroListVC: BaseViewController {

    @IBOutlet var tableView: UITableView!
    
    private let networkManager = NetworkManager.shared
    private var superheroes: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Biographies"
    }
}

//MARK: - Networking
private extension HeroListVC {
    func fetchData() {
        networkManager.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                self?.superheroes = data
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HeroListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
        let data = superheroes[indexPath.row]
        cell.heroLabel.text = data.name
        guard let url = URL(string: data.images.lg) else { return UITableViewCell()}
        cell.heroImageView.setImage(with: url)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let infoVC = main.instantiateViewController(withIdentifier: "HeroInfoVC") as! HeroDetailViewController
        let data = superheroes[indexPath.row]
        infoVC.superhero = data
        infoVC.navigationItem.title = data.name
        push(vc: infoVC)
    }
}
