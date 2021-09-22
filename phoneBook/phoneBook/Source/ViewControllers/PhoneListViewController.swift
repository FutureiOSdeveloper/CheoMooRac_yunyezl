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
    var allSectionHeaderList = [String]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSearchNavigationController()
        initNavigationBarButtonItem()
        setTableView()
        setUpLayout()
        generateAllSectionList()
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
        
    private func generateAllSectionList() { /// section index title UI 표시 용도
        let tempSectionHeader = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅍ", "ㅌ", "ㅎ"]
        for index in 0..<tempSectionHeader.count {
            allSectionHeaderList.append(tempSectionHeader[index].precomposedStringWithCompatibilityMapping)
        }
        for dec in 65...90 {
            allSectionHeaderList.append(String(UnicodeScalar(dec)!))
        }
    }
}

// MARK: - UITableViewDelegate

extension PhoneListViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension PhoneListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return peopleViewModel.sectionHeaderList.firstIndex(of: title) ?? 0
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return allSectionHeaderList
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

        return cell
    }

    func sectionArray(at section: Int) -> [String] {
        return peopleViewModel.fullNameList.filter {
            return $0.firstIndexString == peopleViewModel.sectionHeaderList[section]
        }
    }

}
