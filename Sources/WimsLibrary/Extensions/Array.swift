//
//  Array.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 13/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import Foundation

public extension Array {
	func any(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
		for e in self {
			if try predicate(e) {
				return true
			}
		}
		return false
	}
}
