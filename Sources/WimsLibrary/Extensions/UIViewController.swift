//
//  UIViewController.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 10/01/2019.
//

import UIKit

public extension UIViewController {
	
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	func showAlert(title: String, description: String, buttonTitle: String, completion: ((UIAlertAction) -> Void)? = nil) {
		let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completion))
		present(alert, animated: true, completion: nil)
	}
	
	func showYesNoAlert(title: String, description: String, yesAction: @escaping (UIAlertAction) -> Void, noAction: @escaping (UIAlertAction) -> Void, yesText: String, noText: String) {
		let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: yesText, style: .default, handler: yesAction))
		alert.addAction(UIAlertAction(title: noText, style: .default, handler: noAction))
		present(alert, animated: true, completion: nil)
	}
	
	func showOkAlert(title: String, description: String, completion: ((UIAlertAction) -> Void)? = nil) {
		showAlert(title: title, description: description, buttonTitle: "Ok", completion: completion)
	}
}
