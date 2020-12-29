//
//  ButtonsViewController.swift
//  Kipalog
//
//  Created by DTVD on 2019/01/14.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ButtonsViewController: UIViewController, DependencyInjectable {
    typealias Dependency = Post

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var kipalogButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = post.author.name
        if let avatarUrl = post.author.avatarUrl, let url = URL(string: avatarUrl) {
            avatar.kf.setImage(
                with: url,
                options: [.transition(.fade(0.25))]
            )
        } else {
            avatar.image = Asset.maleAvatar.image
        }
        bind()
    }

    private func bind(){
        profileButton.rx.tap
            .asSignal(onErrorSignalWith: .empty())
            .emit(onNext: { [weak self] _ in
                guard let self = self else { return }
                let vc = ProfileViewController(dependency: self.post.author)
                self.parent?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)

        followButton.rx.tap
            .asSignal(onErrorSignalWith: .empty())
            .emit(onNext: { [viewModel] _ in
                viewModel.toggleFollow()
            })
            .disposed(by: disposeBag)

        kipalogButton.rx.tap
            .asSignal(onErrorSignalWith: .empty())
            .emit(onNext: { [viewModel] _ in
                viewModel.toggleKipalog()
            })
            .disposed(by: disposeBag)

        viewModel.followStream
            .bind(to: followButton.rx.isSelected)
            .disposed(by: disposeBag)

        viewModel.kipalogStream
            .bind(to: kipalogButton.rx.isSelected)
            .disposed(by: disposeBag)

    }

    private let disposeBag = DisposeBag()
    private let viewModel: ButtonsViewModel
    var post: Post

    required init(dependency: Post) {
        self.post = dependency
        self.viewModel = ButtonsViewModel(dependency: dependency)
        super.init(nibName: ButtonsViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func inject(dependency: Post) {
        self.post = dependency
    }
}
