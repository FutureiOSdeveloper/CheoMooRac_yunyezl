//
//  ButtonView.swift
//  phoneBook
//
//  Created by 윤예지 on 2021/09/22.
//

import UIKit

class ButtonView: UIView {
    
    lazy var actionImageLabel = UIImageView()
    lazy var actionTextLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textAlignment = .center
        $0.textColor = .systemBlue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        makeViewRounding()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeViewRounding() {
        makeRounded(radius: 10)
    }
    
    private func setBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setUpLayout() {
        addSubviews(actionImageLabel, actionTextLabel)
        
        actionImageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        
        actionTextLabel.snp.makeConstraints {
            $0.top.equalTo(actionImageLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
    }
    
}
