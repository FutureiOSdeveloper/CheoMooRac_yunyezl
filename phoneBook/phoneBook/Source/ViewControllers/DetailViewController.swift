//
//  DetailViewController.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - UI Properties
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private lazy var stackView = UIStackView(arrangedSubviews: [messageView, phoneView, faceView, mailView]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 10
    }
    
    private lazy var messageView = ButtonView().then {
        $0.actionTextLabel.text = "메시지"
        $0.actionImageLabel.image = UIImage(systemName: "message.fill")
    }
    
    private lazy var phoneView = ButtonView().then {
        $0.actionTextLabel.text = "통화"
        $0.actionImageLabel.image = UIImage(systemName: "phone.fill")
    }
    
    private lazy var faceView = ButtonView().then {
        $0.actionTextLabel.text = "FaceTime"
        $0.actionImageLabel.image = UIImage(systemName: "video.fill")
    }
    
    private lazy var mailView = ButtonView().then {
        $0.actionTextLabel.text = "Mail"
        $0.actionImageLabel.image = UIImage(systemName: "video.fill")
    }
    
    private var profileImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person.circle.fill")
        $0.tintColor = .systemGray
    }
    
    private var userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 30)
        $0.text = "윤예지"
    }
    
    struct Size {
        static let phoneNumberHeight: CGFloat = 60
        static let memoHeight: CGFloat = 80
        static let defaultHeight: CGFloat = 50
        static let sectionSpacing: CGFloat = 10
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setTableView()
        registerCell()
        setUpLayout()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .systemGray6
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        tableView.register(DetailTableViewCell.self)
    }
    
    private func setUpLayout() {
        view.addSubviews(profileImageView, userNameLabel, stackView, tableView)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.width.height.equalTo(80)
            $0.centerX.equalToSuperview()
        }

        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}

// MARK: - UITableViewDelegate

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return Size.phoneNumberHeight
        case 2:
            return Size.memoHeight
        default:
            return Size.defaultHeight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return .zero
        default:
            return Size.sectionSpacing / 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Size.sectionSpacing / 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

}

// MARK: - UITableViewDataSource

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let phoneNumberCell: DetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            
            phoneNumberCell.setDescriptionLabel(text: Detail.Plain.phoneNumber.rawValue)
            phoneNumberCell.setLabelColor(color: .black)
            phoneNumberCell.showPhoneNumberLabel()
            
            return phoneNumberCell
        case 1:
            let basicCell = UITableViewCell()
            
            basicCell.textLabel?.text = Detail.Plain.faceTime.rawValue
            
            return basicCell
        case 2:
            let memoCell: DetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            
            memoCell.setDescriptionLabel(text: Detail.Plain.memo.rawValue)
            memoCell.setLabelColor(color: .black)
            
            return memoCell
        case 3:
            let basicCell = UITableViewCell()
            
            let textList = [Detail.Plain.sendMessage.rawValue, Detail.Plain.shareContact.rawValue, Detail.Plain.addFavorites.rawValue]
            
            basicCell.textLabel?.text = textList[indexPath.row]
            basicCell.textLabel?.textColor = .systemBlue
            
            return basicCell
        case 4:
            let basicCell = UITableViewCell()
            
            basicCell.textLabel?.text = Detail.Plain.addEmergencyContact.rawValue
            basicCell.textLabel?.textColor = .systemBlue
            
            return basicCell
        case 5:
            let basicCell = UITableViewCell()
            
            basicCell.textLabel?.text = Detail.Destructive.block.rawValue
            basicCell.textLabel?.textColor = .systemRed
            
            return basicCell
        default:
            return UITableViewCell()
        }
    }
    
}
