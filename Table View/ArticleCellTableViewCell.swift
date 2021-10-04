//
//  ArticleCellTableViewCell.swift
//  Table View
//
//  Created by Abdirizak Hassan on 10/2/21.
//

import UIKit

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

class ArticleCellTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ArticleCellTableViewCell.self)

    @IBOutlet var imageFromApi: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func populate(with article: Article) {
        titleLabel.text = article.headline
//        descriptionLable.text = article.subline
        imageFromApi.kf.setImage(with: article.urlToImage?.asUrl)
    }
    
    
}
