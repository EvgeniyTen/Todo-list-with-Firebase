//
//  TodoCell.swift
//  Todo list with Firebase
//
//  Created by Евгений Тимофеев on 18.03.2022.
//

import UIKit

class TodoCell: UITableViewCell {
    
    
    // MARK: - Properties
    var todoItem: TodoItem? {
        didSet {
            titleLable.text = todoItem?.title
            if let isComplete = todoItem?.isComplete, isComplete {
                statusLabel.text = "Status: complete"
                statusLabel.textColor = .green
            } else {
                statusLabel.text = "Status: incomplete"
                statusLabel.textColor = .darkGray

            }
    
        }
    }
    let reuseIdentifire = "toDoCell"

    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Status incomplete"
        return label
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .thin)
        label.textColor = .gray
        label.text = "Text label"
        return label
    }()
    
    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(titleLable)
        titleLable.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 8)
        
        addSubview(statusLabel)
        statusLabel.anchor(top: titleLable.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
