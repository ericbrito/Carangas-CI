//
//  AddEditViewController.swift
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
    
    // MARK: - Properties
    var viewModel: CarFormViewModel?
    weak var coordinator: CarFormCoordinator?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        setupView()
    }
    
    // MARK: - Methods
    private func setupView() {
        guard let viewModel = viewModel else {return}
        title = viewModel.title
        btAddEdit.setTitle(viewModel.buttonTitle, for: .normal)
        tfBrand.text = viewModel.brand
        tfName.text = viewModel.name
        tfPrice.text = viewModel.price
        scGasType.selectedSegmentIndex = viewModel.fuelIndex
    }
    
    func checkResult(_ result: Result<Void,APIError>, withError message: String) {
        DispatchQueue.main.async {
            switch result {
            case .success:
                self.goBack()
            case .failure(let apiError):
                Alert.show(title: "Erro", message: "\(message) Erro: \(apiError.errorMessage)", presenter: self)
            }
        }
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func addEdit(_ sender: UIButton) {
        viewModel?.saveCar(name: tfName.text!, brand: tfBrand.text!, gasType: scGasType.selectedSegmentIndex, price: tfPrice.text!)
    }
    
    deinit {
        coordinator?.childDidFinish(nil)
        print("CarFormViewController deinit")
    }
}

extension CarFormViewController: CarFormViewModelDelegate {
    func onCarCreated(result: Result<Void, APIError>) {
        self.checkResult(result, withError: "Falha ao criar o carro")
    }
    
    func onCarUpdated(result: Result<Void, APIError>) {
        self.checkResult(result, withError: "Falha ao atualizar o carro")
    }
}
