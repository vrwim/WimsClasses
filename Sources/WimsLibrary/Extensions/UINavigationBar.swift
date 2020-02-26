//
//  UINavigationBar.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 05/07/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension UINavigationBar {
	func setGradientBackground(colors: [UIColor]) {
		
		var updatedFrame = bounds
		updatedFrame.size.height += self.frame.origin.y
		let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
		
		setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
	}
}
