//
//  MovieTableViewCell.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 24.11.2024.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.backgroundColor = .blue
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(titleLabel)
        backgroundColor = .red
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(with movie: MovieResult) {
        let title = movie._title
        
        titleLabel.text = title
    }
}
