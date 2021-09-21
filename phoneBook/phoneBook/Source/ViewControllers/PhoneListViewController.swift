//
//  PhoneListViewController.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/21.
//

import UIKit

import SnapKit
import Then

class PhoneListViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let phoneListTableView = UITableView()
    
    // MARK: - Properties
    
    let peopleViewModel = PeopleViewModel()
    var allSectionHeader: [String] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchNavigationController()
        initNavigationBarButtonItem()
        setTableView()
        setUpLayout()
    }
    
    // MARK: - Custom Method
    
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
    
    private func setTableView() {
        phoneListTableView.delegate = self
        phoneListTableView.dataSource = self
    }
    
    private func setUpLayout() {
        view.addSubviews(phoneListTableView)
        
        phoneListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

// MARK: - UITableViewDelegate

extension PhoneListViewController: UITableViewDelegate {
   
}

// MARK: - UITableViewDataSource

extension PhoneListViewController: UITableViewDataSource {
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return peopleViewModel.sectionHeaderList
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return peopleViewModel.sectionHeaderList[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return peopleViewModel.sectionHeaderList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray(at: section).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = sectionArray(at: indexPath.section)[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }

    func sectionArray(at section: Int) -> [String] {
        return peopleViewModel.fullNameList.filter {
            return $0.firstIndexString == peopleViewModel.sectionHeaderList[section]
        }
    }

}
