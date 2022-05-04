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
    
    override func loadView() {
        super.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func binding() {
        
        
        Observable.of(PostModel.sampleData).bind(to: mainView.feedTableView.rx.items) { (tableView, row, element) -> UITableViewCell in
                
                switch row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryCollectionTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? StoryCollectionTableViewCell else { return UITableViewCell() }
                    
                    
                    
                    return cell
                default:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? PostTableViewCell else { return UITableViewCell() }
                    
                    cell.topNameButton.setTitle(element.name, for: .normal)
                    cell.profileImageView.image = UIImage(named: element.profileImageName)
                    cell.bottomNameButton.setTitle(element.name, for: .normal)
                    cell.postIamgeView.image = UIImage(named: element.postImageName)

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
