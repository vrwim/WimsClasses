//
//  AttributedStringBuilder.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 09/02/16.
//  Copyright © 2016 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString
{
	var underline: NSMutableAttributedString {
		let range = NSRange(location: 0, length: length)
		addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue], range: range)
		
		return self
	}
	
	var center: NSMutableAttributedString {
		let range = NSRange(location: 0, length: length)
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.alignment = .center
		addAttributes([.paragraphStyle: paragraphStyle], range: range)
		
		return self
	}
	
	func append(_ text: String, style: Style) -> NSMutableAttributedString {
		let beginIndex = self.length
		append(NSAttributedString(string: text))
		let length = self.length - beginIndex
		let range = NSRange(location: beginIndex, length: length)
		addAttributes(style.stringAttributes, range: range)
		
		return self
	}
	
	func append(_ image: UIImage) -> NSMutableAttributedString {
		return append(image, size: image.size)
	}
	
	func append(_ image: UIImage, size: CGSize) -> NSMutableAttributedString {
		return append(image, rect: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
	}
	
	func append(_ image: UIImage, rect: CGRect) -> NSMutableAttributedString
	{
		let imageAttachment = NSTextAttachment()
		imageAttachment.image = image
		imageAttachment.bounds = rect
		append(NSAttributedString(attachment: imageAttachment))
		
		return self
	}
}

public struct Style {
	
	var font: UIFont
	var color: UIColor
	var minimumLineHeight: CGFloat
	var textAlignment: NSTextAlignment
	
	public var stringAttributes: [NSAttributedString.Key: AnyObject] {
		get {
			let paragraphStyle = NSMutableParagraphStyle()
			paragraphStyle.minimumLineHeight = minimumLineHeight
			paragraphStyle.alignment = textAlignment
			
			let stringAttributes: [NSAttributedString.Key: AnyObject] =
				[
					.font: font,
					.foregroundColor: color,
					.paragraphStyle: paragraphStyle
			]
			return stringAttributes
		}
	}
	
	public init(font: String, fontSize: CGFloat, foregroundColor: UIColor, minimumLineHeight: Float = -1, textAlignment: NSTextAlignment = .left)
	{
		self.init(font: UIFont(name: font, size: fontSize)!, color: foregroundColor, minimumLineHeight: minimumLineHeight, textAlignment: textAlignment)
	}
	
	public init(font: UIFont, color: UIColor, minimumLineHeight: Float = -1, textAlignment: NSTextAlignment = .left)
	{
		self.font = font
		self.color = color
		self.minimumLineHeight = CGFloat(minimumLineHeight == -1 ? Float(font.pointSize) + 3 : minimumLineHeight)
		self.textAlignment = textAlignment
	}
}
