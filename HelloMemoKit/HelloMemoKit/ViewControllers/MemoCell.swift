//
//  MemoCell.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

// 커스텀 셀 만들기
class MemoCell: UITableViewCell {
    
    public lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var memoTextLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var memoCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .secondaryLabel
        return label
    }()
    
    public lazy var memoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var outStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        return stackView
    }()
    
    private lazy var memoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    private lazy var inStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(memoStackView)
        
        outStackView.addArrangedSubview(emojiLabel)
        outStackView.addArrangedSubview(inStackView)
        
        inStackView.addArrangedSubview(memoTextLabel)
        inStackView.addArrangedSubview(memoCreatedAtLabel)
        
        memoStackView.addArrangedSubview(outStackView)
        memoStackView.addArrangedSubview(memoImageView)
        
        memoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            memoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            memoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            memoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            emojiLabel.widthAnchor.constraint(equalToConstant: 30),
            memoImageView.heightAnchor.constraint(equalTo: memoImageView.widthAnchor), // 정사각형 만들기
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
