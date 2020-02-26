//
//  UIColor.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 10/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension UIColor {
	static var random: UIColor {
		let hue: CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
		let saturation: CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
		let brightness: CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
		
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
	}

	/// Returns a color that is `percentage` in between `self` and the given `UIColor`
	func toColor(_ color: UIColor, percentage: CGFloat) -> UIColor {
		let percentage = max(min(percentage, 1), 0)
		switch percentage {
		case 0: return self
		case 1: return color
		default:
			var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
			var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
			guard self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return self }
			guard color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return self }
			
			return UIColor(red: CGFloat(r1 + (r2 - r1) * percentage),
						   green: CGFloat(g1 + (g2 - g1) * percentage),
						   blue: CGFloat(b1 + (b2 - b1) * percentage),
						   alpha: CGFloat(a1 + (a2 - a1) * percentage))
		}
	}
}
