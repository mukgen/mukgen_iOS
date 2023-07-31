//
//  TodayCafeteriaReview.swift
//  Presentation
//
//  Created by 박준하 on 2023/07/31.
//
import UIKit
import SnapKit
import Then
import MukgenKit

class TodayCafeteriaReview: UIView {
    private final var controller: UIViewController
    
    private lazy var popularPost = UILabel().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.text = "오늘 급식 리뷰"
        $0.textColor = .black
    }
    
    private lazy var morePost = UIButton().then {
        $0.setTitle("다른날 보러가기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(MukgenKitAsset.Colors.pointLight1.color, for: .normal)
    }
    
    private lazy var popularPostCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(TodayReviewCell.self, forCellWithReuseIdentifier: TodayReviewCell.TodayReviewCell)
        
        return collectionView
        
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        popularPostCollectionView.delegate = self
        popularPostCollectionView.dataSource = self
        
        layout()
        popularPostCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(popularPostCollectionView)
        self.addSubview(popularPost)
        self.addSubview(morePost)
        
        popularPostCollectionView.snp.makeConstraints {
            $0.height.equalTo(363.0)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        popularPost.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview()
        }
        
        morePost.snp.makeConstraints {
            $0.top.equalToSuperview().offset(3.5)
            $0.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayCafeteriaReview: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 92.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 36.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}

extension TodayCafeteriaReview: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sdfsdf")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayReviewCell.TodayReviewCell, for: indexPath) as! TodayReviewCell
        cell.backView.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        cell.layer.cornerRadius = 10.0
        return cell
    }
}

