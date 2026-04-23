//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 22/04/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}
