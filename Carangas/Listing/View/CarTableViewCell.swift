//
//  CarTableViewCell.swift
//  Carangas
//
//  Created by Eric Alves Brito on 08/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol VehicleCellProtocol {
    var name: String {get}
    var brand: String {get}
}

class CarTableViewCell: UITableViewCell {

    func configure(with viewModel: VehicleCellProtocol) {
        textLabel?.text = viewModel.name
        detailTextLabel?.text = viewModel.brand
    }

}
