//
//  UIToolbar.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 12/07/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension UIToolbar {
	
	/// Creates a new UIToolbar with one button, that performs the given action on the given object when tapped
	convenience init(object: NSObject, action: Selector, title: String, buttonColor: UIColor) {
		self.init()
		
		barStyle = .default
		isTranslucent = true
		tintColor = buttonColor
		sizeToFit()
		
		let doneButton = UIBarButtonItem(title: title, style: .plain, target: object, action: action)
		doneButton.setTitleTextAttributes([.foregroundColor: buttonColor], for: .normal)
		let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		
		setItems([space, doneButton], animated: false)
		isUserInteractionEnabled = true
	}
}
