//
//  UIViewController+Instantiate.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 22/10/21.
//  Copyright © 2021 Eric Brito. All rights reserved.
//

import UIKit

extension UIViewController {
	
	static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self {
		let name = String(describing: self)
		return storyboard.instantiateViewController(withIdentifier: name) as! Self
	}
}
