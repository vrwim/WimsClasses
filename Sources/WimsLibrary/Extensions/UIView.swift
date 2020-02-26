//
//  UIImage.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 05/07/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension UIView {
	func snapshot() -> UIImage {
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
		
		layer.render(in: UIGraphicsGetCurrentContext()!)
		
		let image = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		return image
	}
	
	func addCornerRadius(usingCorners corners: UIRectCorner, cornerRadii: CGSize)
	{
		let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)

		let maskLayer = CAShapeLayer()
		maskLayer.path = path.cgPath

		self.layer.mask = maskLayer
	}
}
