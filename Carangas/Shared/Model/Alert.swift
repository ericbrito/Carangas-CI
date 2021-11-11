//
//  Alert.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

class Alert {
	static func show(title: String?, message: String?, presenter: UIViewController) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(okAction)
		presenter.present(alert, animated: true, completion: nil)
	}
}
