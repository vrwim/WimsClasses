//
//  CAGradientLayer.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 05/07/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension CAGradientLayer {
	
	convenience init(frame: CGRect, colors: [UIColor]) {
		self.init()
		self.frame = frame
		self.colors = []
		for color in colors {
			self.colors?.append(color.cgColor)
		}
		startPoint = CGPoint(x: 0, y: 0)
		endPoint = CGPoint(x: 1, y: 0)
	}
	  
	func createGradientImage() -> UIImage? {
		
		var image: UIImage? = nil
		UIGraphicsBeginImageContext(bounds.size)
		if let context = UIGraphicsGetCurrentContext() {
			render(in: context)
			image = UIGraphicsGetImageFromCurrentImageContext()
		}
		UIGraphicsEndImageContext()
		return image
	}
	
}
