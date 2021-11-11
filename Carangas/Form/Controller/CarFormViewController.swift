//
//  CarFormViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarFormViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tfBrand: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var scGasType: UISegmentedControl!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    // MARK: - Properties
	var viewModel: CarFormViewModel?
	weak var coordinator: FormCoordinator?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }
	
	// MARK: - Methods
	private func setupView() {
		
		viewModel = viewModel ?? CarFormViewModel()
		
		viewModel?.delegate = self
		title = viewModel?.title
		tfName.text = viewModel?.name
		tfBrand.text = viewModel?.brand
		tfPrice.text = viewModel?.price
		scGasType.selectedSegmentIndex = viewModel?.gastypeIndex ?? 0
		btAddEdit.setTitle(viewModel?.buttonTitle, for: .normal)
	}
    
    // MARK: - IBActions
    @IBAction func addEdit(_ sender: UIButton) {
		viewModel?.saveCar(name: tfName.text!,
						   brand: tfBrand.text!,
						   gastypeIndex: scGasType.selectedSegmentIndex,
						   price: tfPrice.text!)
    }
    
    // MARK: - Methods
    private func goBack() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
	
	private func checkResult(_ result: Result<Void, APIError>, withError message: String) {
		switch result {
			case .success:
				goBack()
			case .failure(let apiError):
				DispatchQueue.main.async {
					Alert.show(title: "Erro", message: "\(message) \(apiError.errorMessage)", presenter: self)
				}
		}
	}
	
	deinit {
		print("CarFormViewController deinit")
		coordinator?.childDidFinish(nil)
	}
}

extension CarFormViewController: CarFormViewModelDelegate {
	func onCarCreated(result: Result<Void, APIError>) {
		checkResult(result, withError: "Falha ao criar o carro! Motivo: ")
	}
	
	func onCarUpdated(result: Result<Void, APIError>) {
		checkResult(result, withError: "Falha ao atualizar o carro! Motivo: ")
	}
}
