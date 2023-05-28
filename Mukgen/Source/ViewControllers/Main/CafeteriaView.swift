//
//  CafeteriaView.swift
//  Mukgen
//
//  Created by 이은호 on 2023/05/19.
//

import UIKit
import SnapKit
import Then

class CafeteriaView: UIView {
    private final var controller: UIViewController
    
    private lazy var todayCafeteriaTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.text = "오늘의 급식"
        $0.textColor = .black
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CafeteriaCollecionViewCell.self, forCellWithReuseIdentifier: "CafeteriaCollecionViewCell")
        
        return collectionView
    }()
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CafeteriaView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CafeteriaCollecionViewCell", for: indexPath) as? CafeteriaCollecionViewCell
        
        cell?.layout()
        
        cell?.layer.cornerRadius = 15.0
        cell?.backgroundColor = .primaryLight3
        
        if indexPath.row == 1 {
            cell?.breakfastImage.image = UIImage(named: "Lunch")
            cell?.breakfastText.text = "점심"
            
        }
        
        if indexPath.row == 2 {
            cell?.breakfastImage.image = UIImage(named: "Night")
            cell?.breakfastText.text = "저녁"
        }
        
        
        return cell ?? UICollectionViewCell()
    }
}

extension CafeteriaView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:  (collectionView.frame.width) - 40.0, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}

extension CafeteriaView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row) 클릭")
    }
}

private extension CafeteriaView {
    
    func layout() {
        [
            todayCafeteriaTitle,
            collectionView
        ].forEach { addSubview($0) }
        
        todayCafeteriaTitle.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(todayCafeteriaTitle.snp.bottom).offset(25.0)
            $0.height.equalTo(240)
            $0.bottom.equalToSuperview()
        }
    }
}
