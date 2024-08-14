//
//  GenericCell.swift
//  OlaMapExample
//
//  Created by Abhishek Ravi on 12/04/24.
//

import UIKit

class GenericCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.spacing = 6.0
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 16.0)
        return label
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Medium", size: 12.0)
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        setupUI()
    }
    
    private func setupUI() {
        
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(labelTitle)
        self.stackView.addArrangedSubview(labelDescription)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16.0),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0)
        ])
        
    }
    
    func setText(text: String, description: String) {
        self.labelTitle.text = text
        self.labelDescription.text = description
    }

    private func initialize() {
        self.backgroundColor = UIColor.white
        self.labelTitle.textColor = UIColor.black
        self.labelDescription.textColor = UIColor.lightGray
    }
    
}
