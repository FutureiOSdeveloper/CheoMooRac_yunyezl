//
//  String+isAlpha.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/23.
//

import Foundation

extension String {
    
    func isAlpha() -> Bool {
       switch self {
       case "a"..."z":
           return true
       case "A"..."Z":
           return true
       default:
           return false
       }
    }
    
}
