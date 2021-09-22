//
//  detail.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/22.
//

import Foundation

struct Detail {
    
    enum Plain: String {
        case phoneNumber = "전화번호"
        case faceTime = "FaceTime"
        case sendMessage = "메시지 보내기"
        case shareContact = "연락처 공유"
        case addFavorites = "즐겨찾기에 추가"
        case addEmergencyContact = "긴급 연락처에 추가"
        case memo = "메모"
    }
    
    enum Destructive: String {
        case block = "이 발신자 차단"
    }
    
}
