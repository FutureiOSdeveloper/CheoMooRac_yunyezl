//
//  String+ExtractFirstIndexString.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/21.
//

import Foundation

extension String {
    
    var firstIndexString: String {
        return self.decomposedStringWithCompatibilityMapping.unicodeScalars.map { String($0) }[0]
    }
    
}
