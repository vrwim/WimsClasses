//
//  UITableView.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 12/07/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public typealias UITableViewSource = UITableViewDelegate & UITableViewDataSource

public extension UITableView {
	var source: UITableViewSource {
		set {
			dataSource = newValue
			delegate = newValue
		}
		get {
			if dataSource is UITableViewDelegate {
				return dataSource as! UITableViewSource
			}
			if delegate is UITableViewDataSource {
				return dataSource as! UITableViewSource
			}
			assert(false, "The 'source' is not a valid UITableViewSource")
			return self.source
		}
	}
	
	func register<T>(class type: T.Type) where T: UITableViewCell {
		register(type.nib, forCellReuseIdentifier: type.key)
	}
	
	func dequeue<T>(class type: T.Type) -> T where T: UITableViewCell {
		return dequeueReusableCell(withIdentifier: T.key) as! T
	}
}
