//
//  PeopleViewModel.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/21.
//

import Foundation

class PeopleViewModel {
    
    // MARK: - Properties
    
    let peopleList: [People] = [
        People(lastName: "윤", firstName: "예지", phoneNumber: 01026837507),
        People(lastName: "김", firstName: "혜수", phoneNumber: 01012345678),
        People(lastName: "김", firstName: "루희", phoneNumber: 01012345678),
        People(lastName: "김", firstName: "윤서", phoneNumber: 01012345678),
        People(lastName: "리안", firstName: "", phoneNumber: 01012345678),
        People(lastName: "", firstName: "모니카", phoneNumber: 01012345678),
        People(lastName: "시", firstName: "미즈", phoneNumber: 01012345678),
        People(lastName: "", firstName: "립제이", phoneNumber: 01012345678),
        People(lastName: "Ariana", firstName: "Grande", phoneNumber: 01012345678),
        People(lastName: "Swift", firstName: "Taylor", phoneNumber: 01012345678)
    ]
    
    var fullNameList: [String] {
        return peopleList.map { $0.lastName + $0.firstName }.sorted()
    }
    
    var numOfPeopleList: Int {
        return peopleList.count
    }
    
    var sectionHeaderList: [String] {
        var sectionHeaderList: [String] = []
        
        generateFirstStringList(list: fullNameList).forEach {
            sectionHeaderList.append(String($0).firstIndexString)
        }
        
        return Array(Set(sectionHeaderList)).sorted()
    }
    
    // MARK: - Fucntions
    
    func peopleList(at index: Int) -> People {
        return peopleList[index]
    }
    
    private func generateFirstStringList(list: [String]) -> [String] {
        var startIndexStringList: [String] = []
        
        list.forEach {
            startIndexStringList.append(String($0[$0.startIndex]))
        }
        
        return startIndexStringList
    }
    
}
