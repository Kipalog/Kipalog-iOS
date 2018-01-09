//
//  SearchViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UICollectionViewController, TabConvertible {
    let barImageName = "Search"

    override var collectionView: UICollectionView! {
        get { return super.collectionView }
        set { super.collectionView = newValue }
    }

    private let disposeBag = DisposeBag()
    private let searchInput = PublishRelay<String?>()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        navigationItem.title = "Kipalog"
        setupSearchBar()
        binding()
    }

    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Tìm kiếm"
        searchController.searchBar.barStyle = .black
        searchController.searchBar.tintColor = UIColor.white
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            present(searchController, animated: true, completion: nil)
        }
        definesPresentationContext = true
    }

    private func binding() {
        searchInput.asSignal()
            .flatMap{ input -> Signal<String> in
                guard let text = input, !text.isEmpty else { return Signal.empty() }
                return Signal.just(text)
            }
            .debounce(0.5)
            .emit(onNext: { text in
                print(text)
            })
            .disposed(by: disposeBag)
    }

}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchInput.accept(searchController.searchBar.text)
    }
}
