//
//  MainView.swift
//  DiceGame
//
//  Created by 박재경 on 2022/10/11.
//

import UIKit

class MainView: UIView {
    
    // title
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Random Dice"
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 30)
        lb.textColor = .black
        
        return lb
    }()
    
    // input dice count text field
    lazy var diceCountText: UITextField = {
        let txt = UITextField()
        //        txt.delegate = self // delegate를 Extension 한 것을 위임받게 함.
        txt.placeholder = "주사위 개 수 입력(max 3)"
        txt.textAlignment = .center
        txt.font = .systemFont(ofSize: 20)
        txt.textColor = .black
        txt.layer.borderWidth = 2
        
        return txt
    }()
    // dice Image
    
    lazy var diceImg1: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // 이미지 딱 맞게
        img.image = UIImage(named: "dice1")
        return img
    }()
    
    lazy var diceImg11: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // 이미지 딱 맞게
        img.image = UIImage(named: "dice1")
        return img
    }()
    
    lazy var diceImg111: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // 이미지 딱 맞게
        img.image = UIImage(named: "dice1")
        return img
    }()
    
    lazy var diceImg2: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "dice2")
        
        return img
    }()
    
    lazy var diceImg22: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "dice2")
        
        return img
    }()
    
    lazy var diceImg3: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "dice3")
        
        return img
    }()
    
    lazy var diceStack2: UIStackView = {
        let stackImg = UIStackView(arrangedSubviews: [diceImg11, diceImg2])
        stackImg.axis = .horizontal
        stackImg.alignment = .fill
        stackImg.distribution = .fillEqually
        stackImg.spacing = 5
        return stackImg
    }()
    
    lazy var diceStack3: UIStackView = {
        let stackImg = UIStackView(arrangedSubviews: [diceImg111, diceImg22, diceImg3])
        stackImg.axis = .horizontal
        stackImg.alignment = .fill
        stackImg.distribution = .fillEqually
        stackImg.spacing = 5
        return stackImg
    }()
    
    var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("START", for: .normal)
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
//        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 50)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateConstraints()
    }
    required init?(coder:NSCoder){ // override init 넣으면 같이 넣어줘야 함.
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.backgroundColor = .white
        addViews()
        titleLabelConstraints()
        diceCountTextConstraints()
        diceImageConstraints()
//        diceStack2Constraints()
//        diceStack3Constraints()
        startButtonConstraints()
        super.updateConstraints()
    }
    
    func addViews() {
        self.addSubview(titleLabel)
        self.addSubview(diceCountText)
        self.addSubview(diceImg1)
        self.addSubview(diceStack2)
        self.addSubview(diceStack3)
        self.addSubview(startButton)
    }
    
    func titleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func diceCountTextConstraints() {
        diceCountText.translatesAutoresizingMaskIntoConstraints = false
        diceCountText.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true // 동적으로 가로 지정
        diceCountText.heightAnchor.constraint(equalToConstant: 50).isActive = true // 높이
        //        diceCountText.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20).isActive = true
        //        diceCountText.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20).isA
        diceCountText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true // 상단 위치
        diceCountText.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func diceImageConstraints() {
        diceImg1.translatesAutoresizingMaskIntoConstraints = false
        diceImg1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        diceImg1.heightAnchor.constraint(equalToConstant: 200).isActive = true // 높이
        diceImg1.leadingAnchor.constraint(equalTo: diceCountText.leadingAnchor, constant: 20).isActive = true
        diceImg1.topAnchor.constraint(equalTo: diceCountText.bottomAnchor, constant: 20).isActive = true // 상단 위치
        diceImg1.centerXAnchor.constraint(equalTo: diceCountText.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func diceStack2Constraints() {
        diceStack2.translatesAutoresizingMaskIntoConstraints = false
        diceStack2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        diceStack2.heightAnchor.constraint(equalToConstant: 200).isActive = true // 높이
        diceStack2.leadingAnchor.constraint(equalTo: diceCountText.leadingAnchor, constant: 20).isActive = true
        diceStack2.topAnchor.constraint(equalTo: diceCountText.bottomAnchor, constant: 20).isActive = true // 상단 위치
        diceStack2.centerXAnchor.constraint(equalTo: diceCountText.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func diceStack3Constraints() {
        diceStack3.translatesAutoresizingMaskIntoConstraints = false
        diceStack3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        diceStack3.heightAnchor.constraint(equalToConstant: 200).isActive = true // 높이
        diceStack3.leadingAnchor.constraint(equalTo: diceCountText.leadingAnchor, constant: 20).isActive = true
        diceStack3.topAnchor.constraint(equalTo: diceCountText.bottomAnchor, constant: 20).isActive = true // 상단 위치
        diceStack3.centerXAnchor.constraint(equalTo: diceCountText.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func startButtonConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true // 높이
        startButton.leadingAnchor.constraint(equalTo: diceCountText.leadingAnchor, constant: 20).isActive = true
        startButton.topAnchor.constraint(equalTo: diceCountText.bottomAnchor, constant: 300).isActive = true // 상단 위치
//        startButton.topAnchor.constraint(equalTo: self.bottomAnchor , constant: 200).isActive = true
        startButton.centerXAnchor.constraint(equalTo: diceCountText.centerXAnchor).isActive = true // x 중앙 정렬
        startButton.titleLabel?.textAlignment = .center
    }
}
