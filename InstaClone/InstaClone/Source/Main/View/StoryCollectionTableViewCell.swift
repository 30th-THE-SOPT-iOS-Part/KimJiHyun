//
//  StoryCollectionTableViewCell.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/02.
//

import UIKit

import RxSwift
import RxCocoa

import SnapKit
import Then

class StoryCollectionTableViewCell: UITableViewCell {
    
    static let identifier = "StoryCollectionTableViewCell"
    private var disposeBag = DisposeBag()
    
    var storyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        $0.collectionViewLayout = layout
        $0.backgroundColor = .systemGray6
        $0.showsHorizontalScrollIndicator = false
        $0.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        Observable.of(StoryModel.sampleData).bind(to: storyCollectionView.rx.items(
            cellIdentifier: StoryCollectionViewCell.identifier, cellType: StoryCollectionViewCell.self)) { (row, element, cell) in
                
                print(element.name)
                
            }
            .disposed(by: disposeBag)

        contentView.addSubview(storyCollectionView)
    }
    
    func constraints() {
        
        storyCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
