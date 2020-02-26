//
//  VCWithBackButtonHandler.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 11/12/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public protocol VCWithBackButtonHandler {
	func shouldPopOnBackButton() -> Bool
}

extension UINavigationController: UINavigationBarDelegate {
	public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
		
		if viewControllers.count < (navigationBar.items?.count) ?? 0 {
			return true
		}
		
		var shouldPop = true
		let topViewController = self.topViewController
		
		if let topViewController = topViewController as? VCWithBackButtonHandler {
			shouldPop = topViewController.shouldPopOnBackButton()
		}
		
		if shouldPop {
			DispatchQueue.main.async {[weak self] in
				_ = self?.popViewController(animated: true)
			}
		} else {
			for subView in navigationBar.subviews {
				if 0 < subView.alpha && subView.alpha < 1 {
					UIView.animate(withDuration: 0.25, animations: {
						subView.alpha = 1
					})
				}
			}
		}
		
		return false
	}
}
