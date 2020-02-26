//
//  UINib.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 09/08/2019.
//

import UIKit

public extension UINib {
	/// Creates a UIView subclass of the given type, from a nib with that name
	static func create<T>(forClass: T.Type) -> T {
		return UINib(nibName: String(describing: forClass), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! T
	}
}
