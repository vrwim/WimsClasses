//
//  Optional.swift
//  WimsLibrary
//
//  https://oleb.net/blog/2016/12/optionals-string-interpolation/
//  Created by Wim Van Renterghem on 12/03/2019.
//  Copyright © 2019 Wim Van Renterghem. All rights reserved.
//

import Foundation

infix operator ???: NilCoalescingPrecedence

public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String {
	switch optional {
	case let value?: return String(describing: value)
	case nil: return defaultValue()
	}
}
