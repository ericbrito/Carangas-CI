//
//  CarAPIProtocol.swift
//  Carangas
//
//  Created by Eric Alves Brito on 17/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

protocol CarAPIProtocol {
    static func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void)
}
