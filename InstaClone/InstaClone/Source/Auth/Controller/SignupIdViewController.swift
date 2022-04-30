//
//  SignupIdViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

class SignupIdViewController: BaseViewController {
    
    let mainView = SignupIdView()
    let viewModel = SignupIdViewModel()
    
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
        
        let input = SignupIdViewModel.Input(
            userIdText: mainView.userIdTextField.rx.text,
            nextTap: mainView.nextButton.rx.tap
        )
        
        let output = viewModel.transform(input: input)
        
        output.tapNextButton
            .subscribe { [weak self] _ in
                let vc = SignupPwdViewController()
                vc.userId = (self?.mainView.userIdTextField.text) ?? ""
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        output.nextButtonValid
            .bind(to: mainView.nextButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
