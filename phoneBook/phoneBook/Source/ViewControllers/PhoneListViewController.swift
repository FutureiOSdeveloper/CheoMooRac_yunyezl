//
//  PhoneListViewController.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/21.
//

import UIKit
import SnapKit

class PhoneListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchNavigationController()
        initNavigationBarButtonItem()
    }
    private func initSearchNavigationController() {
        searchController.searchBar.placeholder = "검색"
        navigationItem.title = "연락처"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func initNavigationBarButtonItem() {
        let groupBarButtonItem = UIBarButtonItem(title: "그룹", style: .plain, target: self, action: nil)
        let plusBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = groupBarButtonItem
        navigationItem.rightBarButtonItem = plusBarButtonItem
    }
    