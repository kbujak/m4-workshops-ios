//
//  CatBreedTableViewCell.swift
//  CatFacts
//
//  Created by Krystian Bujak on 07/05/2019.
//  Copyright © 2019 SwingDev. All rights reserved.
//

import UIKit
import PureLayout

class CatBreedTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let iconView = UIImageView()

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
        [titleLabel, iconView].forEach { self.addSubview($0) }

        setupLayouts()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func setup(with viewModel: CatBreedDetailsViewModel) {
        iconView.image = UIImage(asset: Asset.cat)
        titleLabel.text = viewModel.catBreed.breed
    }
}

extension CatBreedTableViewCell {
    private func setupLayouts() {
        titleLabel.autoCenterInSuperview()
        iconView.autoPinEdge(toSuperviewEdge: ALEdge.left, withInset: 16)
        iconView.autoAlignAxis(ALAxis.horizontal, toSameAxisOf: self)
        iconView.autoSetDimensions(to: CGSize(width: 30, height: 38))
        iconView.contentMode = ContentMode.scaleAspectFit
    }
}
