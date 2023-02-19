//
//  MovieNewsViewController.swift
//  LearningSwift
//
//  Created by Sniper on 2023/2/19.
//

import Foundation
import HandyJSON

class MovieNewsViewController: BaseViewController {
    
    private lazy var movieNewsList: Array<MovieNewsItem> = {
        let movieNewsList = Array<MovieNewsItem>()
        return movieNewsList
    }()

    private lazy var movieNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 160)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ConstSize.screenWidth, height: ConstSize.screenHeight - ConstSize.tabbarHeight), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieNewsCollectionCell.self, forCellWithReuseIdentifier: MovieNewsCollectionCell.cellReuseId)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchData()
    }
    
    private func setupUI() {
        view.addSubview(movieNewsCollectionView)
    }
}

// MARK: - Fetch Data
extension MovieNewsViewController {
    
    private func fetchData() {
        let movieNewsData = MovieNewsData(method: "GET")
        NetworkManager.shared.sendRequest(movieNewsData) { (result) in
            switch result {
            case .success(let data):
                let movieNewsResponse = JSONDeserializer<MovieNewsResponse>.deserializeFrom(json: String(data: data, encoding: .utf8))
                // let dataResponse = movieNewsResponse?.data
                let dataResponse = movieNewsResponse?.result // 注意这里的接口是result 不是data
                // print("dataResponse result: \(String(describing: dataResponse))")
                let movieNewsList = dataResponse?.newslist
                guard movieNewsList != nil else {
                    return
                }
                print("movieNewsList count: \(movieNewsList!.count)")
                for movieNewsItem in movieNewsList! {
                    self.movieNewsList.append(movieNewsItem)
                }
                self.movieNewsCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MovieNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieNewsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieNewsCollectionCell.cellReuseId, for: indexPath) as! MovieNewsCollectionCell
        let movieNewsItem = movieNewsList[indexPath.row]
        cell.configCell(movieNewsItem: movieNewsItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MovieNewsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let movieNewsItem = movieNewsList[indexPath.row]
        // let movieNewsDetailVC = MovieNewsDetailViewController()
        // movieNewsDetailVC.movieNewsItem = movieNewsItem
        // self.navigationController?.pushViewController(movieNewsDetailVC, animated: true)
    }
}
