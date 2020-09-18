//
//  CarsTableViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol CarPresenter: AnyObject {
    func showCarWith(viewModel: CarViewModel)
}

protocol CarCreator: AnyObject {
    func createCar()
}

typealias CarEnabled = Coordinator & CarPresenter & CarCreator

class CarsTableViewController: UITableViewController {
    
    // MARK: - Properties
    lazy var viewModel = CarsListingViewModel()
    weak var coordinator: CarEnabled?

    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.carsDidUpdate = carsDidUpdate
        refreshControl?.addTarget(self, action: #selector(loadCars), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCars()
    }
    
    // MARK: - Methods
    func carsDidUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    @objc func loadCars() {
        viewModel.loadCars()
    }
    
    // MARK: - IBActions
    @IBAction func createCar(_ sender: UIBarButtonItem) {
        coordinator?.createCar()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CarTableViewCell else {
            return UITableViewCell()
        }
        let carCellViewModel = viewModel.cellViewModelFor(indexPath: indexPath)
        cell.configure(with: carCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteCar(at: indexPath) { (result) in
                switch result {
                case .success:
                    break
                case .failure(let apiError):
                    Alert.show(title: "Erro", message: "Não foi possível excluir o carro. Erro: \(apiError.errorMessage)", presenter: self)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carViewModel = viewModel.getCarViewModelFor(indexPath)
        coordinator?.showCarWith(viewModel: carViewModel)
    }
    
    deinit {
        print("CarsTableViewController deinit")
    }

}
