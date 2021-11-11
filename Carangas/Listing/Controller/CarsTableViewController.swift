//
//  CarsTableViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol CarPresenter: AnyObject {
	func showCarWith(viewModel: CarVisualizationViewModel)
}

protocol CarCreator: AnyObject {
	func createCar()
}

typealias CoordinatorCarEnabled = Coordinator & CarPresenter & CarCreator

class CarsTableViewController: UITableViewController {
    
	// MARK: - Properties
    var viewModel = CarsListingViewModel()
	weak var coordinator: CoordinatorCarEnabled?

    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.accessibilityIdentifier = "carsListTable"
        refreshControl?.addTarget(self, action: #selector(loadCars), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCars()
    }
    
    // MARK: - Methods
    @objc private func loadCars() {
		viewModel.loadCars { result in
			switch result {
			case .success:
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			case .failure(let apiError):
				print(apiError)
			}
			DispatchQueue.main.async {
				self.refreshControl?.endRefreshing()
			}
		}
    }
	
	// MARK: - IBActions
	@IBAction func createCar(_ sender: UIBarButtonItem) {
		coordinator?.createCar()
	}
	
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? VehicleTableViewCell else {
			return UITableViewCell()
		}
		cell.configure(with: viewModel.cellViewModelFor(indexPath))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			viewModel.deleteCar(at: indexPath) { result in
				switch result {
				case .success:
					DispatchQueue.main.async {
						tableView.deleteRows(at: [indexPath], with: .automatic)
					}
				case .failure(let apiResult):
					print(apiResult)
				}
			}
        }
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let carVisualizationViewModel = viewModel.getCarVisualizationViewModelFor(indexPath)
		coordinator?.showCarWith(viewModel: carVisualizationViewModel)
	}
}
