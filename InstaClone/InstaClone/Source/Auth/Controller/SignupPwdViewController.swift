//
//  SignupPwdViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

class SignupPwdViewController: BaseViewController {
    
    let mainView = SignupPwdView()

    var userId: String = ""
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        
        navigationController?.initializeNavigationBarWithBackButton(navigationItem: self.navigationItem)
    }
    
    override func binding() {
        
        mainView.userPwdTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { $0.count >= 2 }
            .bind(to: mainView.nextButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        mainView.nextButton.rx.tap
            .subscribe { [weak self] _ in
                let vc = SignupDoneViewController()
                vc.modalPresentationStyle = .fullScreen
                vc.userId = self?.userId ?? ""
                self?.present(vc, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
}
