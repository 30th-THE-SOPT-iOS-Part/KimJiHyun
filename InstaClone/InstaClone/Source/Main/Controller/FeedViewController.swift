//
//  FeedViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

import RxSwift
import UIKit

class FeedViewController: BaseViewController {
    
    let mainView = FeedView()
    let viewModel = FeedViewModel()

    // 네비게이션 아이템 여기서 만들어주는게 괜찮은 방법일까 ? 네비게이션, 탭바 관리하는 방법 공부하기
    let instagramButton = UIButton().then {
        $0.setImage(UIImage(named: "logo_instagram_small"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    let addFeedButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_add"), for: .normal)
    }
    let checkLikeButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_unlike"), for: .normal)
    }
    let messageButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_share"), for: .normal)
    }
 
    override func loadView() {
        super.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func configureUI() {
        
        navigationController?.addBarButtonItems(navigationItem: self.navigationItem, buttonArray: [addFeedButton, checkLikeButton, messageButton])
        
        navigationController?.addBarButtonItems(navigationItem: self.navigationItem, buttonArray: [instagramButton], isRight: false)
    }
    
    override func binding() {
        
        Observable.of(PostModel.sampleData).bind(to: mainView.feedTableView.rx.items) { [unowned self] (tableView, row, element) -> UITableViewCell in
                
                switch row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryCollectionTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? StoryCollectionTableViewCell else { return UITableViewCell() }
                    
                    return cell
                    
                default:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? PostTableViewCell else { return UITableViewCell() }

                    
                    cell.setData(element)
                    return cell
                }
            }
            .disposed(by: disposeBag)
        
        mainView.feedTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 80
        }
        
        return UITableView.automaticDimension
    }
}
