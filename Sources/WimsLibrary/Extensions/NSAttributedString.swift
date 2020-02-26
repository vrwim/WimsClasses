//
//  NSAttributedString.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 30/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import Foundation

public extension NSAttributedString {
	var html: String? {
		do {
			let htmlData = try data(from: NSMakeRange(0, length), documentAttributes: [.documentType: DocumentType.html])
			return String(data: htmlData, encoding: .utf8)
		}
		catch {
			return nil
		}
	}
}
