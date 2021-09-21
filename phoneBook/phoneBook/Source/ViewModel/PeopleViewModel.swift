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
        People(firstName: "윤", lastName: "예지", phoneNumber: 01026837507),
        People(firstName: "김", lastName: "혜수", phoneNumber: 01012345678),
        People(firstName: "김", lastName: "루희", phoneNumber: 01012345678),
        People(firstName: "김", lastName: "윤서", phoneNumber: 01012345678),
        People(firstName: "", lastName: "리안", phoneNumber: 01012345678),
        People(firstName: "", lastName: "모니카", phoneNumber: 01012345678),
        People(firstName: "", lastName: "시미즈", phoneNumber: 01012345678),
        People(firstName: "", lastName: "립제이", phoneNumber: 01012345678),
        People(firstName: "Grande", lastName: "Ariana", phoneNumber: 01012345678),
        People(firstName: "Swift", lastName: "Taylor", phoneNumber: 01012345678)
    ]
    
    var sortedPeopleList: [People] {
        return peopleList.sorted {
            return $0.firstName < $1.firstName
        }
    }
    
    var numOfPeopleList: Int {
        return peopleList.count
    }
    
    var userNameList: [String] {
        return peopleList.map {
            if !$0.firstName.isEmpty {
                return $0.firstName
            } else {
                return $0.lastName
            }
        }
    }
    
    var sectionHeaderList: [String] {
        var sectionHeaderList: [String] = []
        
        generateFirstStringList(list: userNameList).forEach {
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
