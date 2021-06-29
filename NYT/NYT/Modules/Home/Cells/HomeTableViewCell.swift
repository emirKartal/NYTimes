//
//  HomeTableViewCell.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(with viewModel: HomeCellViewModel) {
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        storyImageView.setImageViewWithUrl(urlString: viewModel.imageUrl)
    }

}
