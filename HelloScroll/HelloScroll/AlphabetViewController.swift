//
//  AlphabetViewController.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class AlphabetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data: [String] = ["A", "B", "C", "D", "E", "F",
                          "G", "H", "I", "J", "K", "L", "M", "N",
                          "O", "P", "Q", "R", "S", "T", "U",
                          "V", "W", "X", "Y", "Z"]
    
    private lazy var collectionView: UICollectionView = {
        // UICollectionView의 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        
        // Cell의 크기와 간격 조정
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 10 // 줄 간격
        layout.minimumInteritemSpacing = 10 // 셀 간격
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .lightGray
        
        // 재활용 가능한 custom cell 선언
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
        
        collectionView.reloadData()
    }
    
    func setupInterface() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDelegate
    
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cell의 재활용
        let cell: MyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        
        cell.label.text = data[indexPath.row]
        
        return cell
    }
    
    // cell을 선택할 때 처리
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hello : \(data[indexPath.row])")
    }
}

class MyCell: UICollectionViewCell {
    let label: UILabel
    
    override init(frame: CGRect) {
        
        label = UILabel()
        
        super.init(frame: frame)
        
        label.frame = contentView.bounds
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle)
        contentView.addSubview(label)
        
        contentView.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    AlphabetViewController()
}
