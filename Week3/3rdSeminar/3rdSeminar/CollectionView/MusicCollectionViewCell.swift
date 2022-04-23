//
//  MusicCollectionViewCell.swift
//  3rdSeminar
//
//  Created by 김지현 on 2022/04/23.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MusicCollectionViewCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ albumData: AlbumDataModel) {
        
        albumImageView.image = UIImage(named: albumData.albumImageName)
        albumTitleLabel.text = albumData.albumTitle
        singerLabel.text = albumData.albumSinger
    }

}
