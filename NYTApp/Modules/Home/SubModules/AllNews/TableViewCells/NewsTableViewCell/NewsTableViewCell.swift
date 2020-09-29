//
//  NewsTableViewCell.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsTitleLabel : UILabel!
    @IBOutlet weak var newsImageView : UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configue(with data : ApiResult) {
        
        newsTitleLabel.text = data.title
        if let multimedia = data.multimedia {
            newsImageView.imageFromServerURL(urlString: multimedia[1].url ?? "", PlaceHolderImage: UIImage())
        }
        
        
    }
    
}






