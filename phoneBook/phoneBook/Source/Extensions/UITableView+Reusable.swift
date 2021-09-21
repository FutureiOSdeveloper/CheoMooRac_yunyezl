//
//  UITableView+Reusable.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/21.
//

import UIKit

protocol ResuableCell: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ResuableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ResuableCell { }

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable Dequeue Reusable")
        }

        return cell
    }
    
    func register<T: UITableViewCell>(_: T.Type) {
          register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
      }
    
}
