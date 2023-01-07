//
//  MainCell.swift
//  PetProject
//
//  Created by Niyazov Makhmujan on 07.01.2023.
//

import UIKit

class MainCell: UITableViewCell {
    
    //MARK: - UI Elements
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let newsTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = .boldSystemFont(ofSize: 15)
        title.textColor = .black
        title.lineBreakMode = .byCharWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let newsSubtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.lineBreakMode = .byCharWrapping
        subtitle.textColor = .black
        subtitle.font = .systemFont(ofSize: 13)
        subtitle.numberOfLines = 0
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    private let publishedDateTitle: UILabel = {
        let dateTitle = UILabel()
        dateTitle.lineBreakMode = .byCharWrapping
        dateTitle.font = .systemFont(ofSize: 10)
        dateTitle.textColor = .lightGray
        dateTitle.numberOfLines = 0
        dateTitle.translatesAutoresizingMaskIntoConstraints = false
        return dateTitle
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func setupLayout() {
        [mainStack, publishedDateTitle].forEach { contentView.addSubview($0) }
        [newsTitle, newsSubtitle].forEach { mainStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
        
            publishedDateTitle.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 10),
            publishedDateTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18)
        ])
        
    }
    
    //MARK: - Setup data
    
    func setup(with model: NewsResults) {
        newsTitle.text = model.title
        newsSubtitle.text = model.abstract
        publishedDateTitle.text = model.publishedData
    }
}
