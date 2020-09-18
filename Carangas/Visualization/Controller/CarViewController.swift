//
//  CarViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lbBrand: UILabel!
    @IBOutlet weak var lbGasType: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    // MARK: - Properties
    var viewModel: CarViewModel?
    weak var coordinator: CarCoordinator?

    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let viewModel = viewModel {
            title = viewModel.title
            lbBrand.text = viewModel.brand
            lbGasType.text = viewModel.fuelType
            lbPrice.text = viewModel.price
        }
    }
    
    // MARK: - IBActions
    @IBAction func editCar(_ sender: UIBarButtonItem) {
        guard let carFormViewModel = viewModel?.getCarFormViewModel() else {return}
        coordinator?.editCar(with: carFormViewModel)
    }
    
    
    deinit {
        print("CarViewController deinit")
        coordinator?.childDidFinish(nil)
    }
}
