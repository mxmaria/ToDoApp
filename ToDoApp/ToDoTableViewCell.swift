//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by Maria Pecheritsyna on 27.06.2021.
//

import UIKit
import PinLayout

class ToDoTableViewCell: UITableViewCell {
    private let taskLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.pin
            .horizontally(12)
            .vertically(5)

        taskLabel.pin
            .left(10)
            .height(19)
            .sizeToFit(.height)
            .vCenter()

    }

    private func setup() {
        taskLabel.font = UIFont.systemFont(ofSize: 16)

        backgroundColor = UIColor(red: 253/255, green: 243/255, blue: 255/255, alpha: 1)

        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.cornerRadius = 6
        contentView.backgroundColor = UIColor.white
        selectionStyle = .none
        contentView.addSubview(taskLabel)
    }
    
    func configure(with model: ItemModel) {
        taskLabel.text = model.title
    }
}
