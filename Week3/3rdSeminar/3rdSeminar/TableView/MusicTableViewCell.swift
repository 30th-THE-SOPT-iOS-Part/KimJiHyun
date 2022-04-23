//
//  MusicTableViewCell.swift
//  3rdSeminar
//
//  Created by 김지현 on 2022/04/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    static let identifier = "MusicTableViewCell"
    
    @IBOutlet weak var albumCoverImage: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicDescriptionLabel: UILabel!
    @IBOutlet weak var moveButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ musicData: MusicDataModel) {
        
        albumCoverImage.image = musicData.albumImage
        musicTitleLabel.text = musicData.musicTitle
        musicDescriptionLabel.text = musicData.description
    }
    
}
