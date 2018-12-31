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

    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()
    private var viewModel: SearchViewModel!
    private let searchInput = PublishRelay<String?>()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        CollectionViewCell<SearchCellViewController, SearchViewController>.register(to: collectionView)
        dataSource.set(parent: self)
        navigationItem.title = "Tìm kiếm"
        setupSearchBar()
        setupLayout()
        binding()
    }

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 150)
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0.0
        }
    }
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Nhập từ khoá"
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
        let searchText = searchInput.asSignal()
            .flatMap{ input -> Signal<String> in
                guard let text = input else { return Signal.empty() }
                return Signal.just(text)
            }
            .debounce(0.5)

        viewModel = SearchViewModel(searchText: searchText)

        viewModel.dataSource
            .asDriver(onErrorDriveWith: .empty())
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchInput.accept(searchController.searchBar.text)
    }
}

extension SearchViewController{
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = SearchViewModel.DataSource

        private(set) var posts: [Post] = []
        private weak var parent: SearchViewController?

        fileprivate func set(parent: SearchViewController) {
            self.parent = parent
        }

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                posts = element.posts
                collectionView.reloadData()
            }
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return posts.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let post = posts[indexPath.row]
            let cell = CollectionViewCell<SearchCellViewController, SearchViewController>.dequeue(from: collectionView, for: indexPath, parent: parent)
            cell.content?.post = post
            return cell
        }
    }
}
