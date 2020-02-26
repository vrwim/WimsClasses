//
//  Bundle.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 14/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import Foundation

public extension Bundle {
	var releaseVersionNumber: String? {
		return infoDictionary?["CFBundleShortVersionString"] as? String
	}
	var buildVersionNumber: String? {
		return infoDictionary?["CFBundleVersion"] as? String
	}
}
