//
//  UIView+addSubviews.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/21.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}
