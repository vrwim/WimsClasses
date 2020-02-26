//
//  UICollectionViewCell.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 07/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
	
	static var key: String {
		get {
			return String(describing: self)
		}
	}
	
	static var nib: UINib {
		get {
			return UINib(nibName: key, bundle: nil)
		}
	}
}
