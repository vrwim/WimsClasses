//
//  String.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 13/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension String {
	var htmlToAttributedString: NSAttributedString? {
		guard let data = data(using: .utf8) else { return nil }
		return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
	}
	
	var htmlToString: String {
		return htmlToAttributedString?.string ?? ""
	}
	
	var isEmptyOrWhitespace: Bool {
		return isEmpty || trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
	}
	
	func height(withConstrainedWidth width: CGFloat, andFont font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		
		return ceil(boundingBox.height)
	}
	
	func width(withConstrainedHeight height: CGFloat, andFont font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		
		return ceil(boundingBox.width)
	}
	
	func trim() -> String {
		return trimmingCharacters(in: .whitespacesAndNewlines)
	}
}
