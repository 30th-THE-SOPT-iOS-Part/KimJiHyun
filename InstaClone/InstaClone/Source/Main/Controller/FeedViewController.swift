//
//  FeedViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

import RxSwift
import UIKit
import RxSwift
import RxCocoa

class FeedViewController: UIViewController {
    
    let mainView = FeedView()
    let viewModel = FeedViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - 사진 데이터
    var photoData: [String] = []

    // MARK: - 네비게이션 바 버튼 아이템
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRandomImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        binding()
        configureUI()
    }
    
    func configureUI() {
        
        navigationController?.addBarButtonItems(navigationItem: self.navigationItem, buttonArray: [addFeedButton, checkLikeButton, messageButton])
        
        navigationController?.addBarButtonItems(navigationItem: self.navigationItem, buttonArray: [instagramButton], isRight: false)
    }
    
    func binding() {
        
        Observable.of(PostModel.sampleData).bind(to: mainView.feedTableView.rx.items) { (tableView, row, element) -> UITableViewCell in
                
                switch row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryCollectionTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? StoryCollectionTableViewCell else { return UITableViewCell() }
                    
                    return cell
                    
                default:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? PostTableViewCell else { return UITableViewCell() }
                    
                    
                    cell.setData(element)
                    // photoData set 보다 디큐가 먼저 되어 첫화면에 사진 안뜸
                    if self.photoData != [] {
                        DispatchQueue.main.async {
                            cell.postImageView.setKFImage(from: self.photoData[row])
                        }
                    }

                    return cell
                }
            }
            .disposed(by: disposeBag)
        
        mainView.feedTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

// MARK: - 이미지 서버통신
extension FeedViewController {
    
    func getRandomImage() {
        APIService.shared.getRandomImage { [weak self] result in
            switch result {
            case .success(let response):
                self?.photoData = response.map { $0.download_url }
                self?.mainView.feedTableView.reloadData()
            case .requestErr(_):
                print("리퀘스트 에러")
            case .networkFail:
                print("네트워크 통신 실패 alert")
            case .serverErr:
                print("서버에러")
            case .pathErr:
                print("에러")
            }
        }
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
