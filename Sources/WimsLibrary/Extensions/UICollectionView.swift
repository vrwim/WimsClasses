//
//  UICollectionView.swift
//  WimsLibrary
//
//  Created by Wim Van Renterghem on 07/08/2018.
//  Copyright © 2018 Wim Van Renterghem. All rights reserved.
//

import UIKit

public typealias UICollectionViewSource = UICollectionViewDelegate & UICollectionViewDataSource

public extension UICollectionView {
	var source: UICollectionViewSource {
		set {
			dataSource = newValue
			delegate = newValue
		}
		get {
			if dataSource is UICollectionViewDelegate {
				return dataSource as! UICollectionViewSource
			}
			if delegate is UICollectionViewDataSource {
				return dataSource as! UICollectionViewSource
			}
			assert(false, "The 'source' is not a valid UICollectionViewSource")
			return self.source
		}
	}
	
	func register<T>(class type: T.Type) where T: UICollectionViewCell {
		register(type.nib, forCellWithReuseIdentifier: type.key)
	}
}
