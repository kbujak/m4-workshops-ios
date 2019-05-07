//
//  CatBreedTableViewCell.swift
//  CatFacts
//
//  Created by Krystian Bujak on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import UIKit

class CatBreedTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)

        setupLayouts()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func setup(with viewModel: CatBreedDetailsViewModel) {
        titleLabel.text = viewModel.catBreed.breed
    }
}

extension CatBreedTableViewCell {
    private func setupLayouts() {
        titleLabel.autoCenterInSuperview()
    }
}
