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
        layout.itemSize = CGSize(width: 58, height: 72)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
        // 1. cell은 재사용이 되기 때문에 화면 밖으로 사라진다고 해서 dispose가 되지 않는다
        // 2. 따라서 reuse 직전 disposebag을 갈아끼워준다
        // 3. 하지만 이 때 collectionView가 reload 되지 않는 이슈 발견
        // 4. 결국 binding 함수를 다시 호출해주었다. (init은 최초에만 .. 근데 이게 최선일까
        binding()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        binding()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binding() {
        
        Observable.of(StoryModel.sampleData).bind(to: storyCollectionView.rx.items(
            cellIdentifier: StoryCollectionViewCell.identifier, cellType: StoryCollectionViewCell.self)) { (row, element, cell) in
                
                cell.profileImageView.image = UIImage(named: element.profileImageName)
                cell.nameLabel.text = element.name
            }
            .disposed(by: disposeBag)
        
    }
    
    func constraints() {
        
        contentView.addSubview(storyCollectionView)
        
        storyCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
