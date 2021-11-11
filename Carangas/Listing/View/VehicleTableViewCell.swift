//
//  CarTableViewCell.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

protocol VehicleCellViewModelProtocol {
	var name: String {get}
	var brand: String {get}
}

class VehicleTableViewCell: UITableViewCell {

	func configure(with viewModel: VehicleCellViewModelProtocol) {
		textLabel?.text = viewModel.name
		detailTextLabel?.text = viewModel.brand
	}

}
