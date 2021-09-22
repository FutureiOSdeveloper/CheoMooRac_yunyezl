//
//  DetailTableViewcCll.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    private var descriptionLabel = UILabel().then {
        $0.textColor = .systemBlue
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private var phoneNumberLabel = UILabel().then {
        $0.textColor = .systemBlue
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.isHidden = true
        $0.text = "010-2683-7507"
    }
    
    var isPhoneNumber: Bool = true
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        addSubviews(descriptionLabel, phoneNumberLabel)
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.leading.equalTo(18)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            $0.leading.equalTo(descriptionLabel.snp.leading)
        }
    }
    
    func setDescriptionLabel(text: String) {
        descriptionLabel.text = text
    }
    
    func setLabelColor(color: UIColor) {
        descriptionLabel.textColor = color
    }

    func showPhoneNumberLabel() {
        phoneNumberLabel.isHidden = false
    }
}
