//
//  MainViewController.swift
//  RSPGame
//
//  Created by 박재경 on 2022/09/30.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var homeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "가위 바위 보"
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 30)
        lb.textColor = .black
        return lb
    }()
    
    private lazy var pcLabel: UILabel = {
        let pclb = UILabel()
        pclb.text = "Computer"
        pclb.textAlignment = .center
        pclb.font = .systemFont(ofSize: 15)
        pclb.textColor = .black
        return pclb
    }()
    
    private lazy var pcChoice: UIImageView = {
        let pcImg = UIImageView(frame:CGRect(x: 0, y: 0, width: 17, height: 17))
        pcImg.contentMode = .scaleToFill // 이미지 딱 맞게
        pcImg.image = UIImage(named: "rock")
        return pcImg
    }()
    
    private lazy var pcStackImg: UIStackView = { // pc lable&pc image stack
        let stackImg = UIStackView(arrangedSubviews: [pcLabel, pcChoice])
//        stackImg.widthAnchor.constraint(equalToConstant: 50).isActive = true //너비
        stackImg.axis = .vertical
        stackImg.alignment = .center
        stackImg.distribution = .fillEqually
        stackImg.spacing = 10
        return stackImg
    }()
    
    private lazy var myLabel: UILabel = {
        let mylb = UILabel()
        mylb.text = "Me"
        mylb.textAlignment = .center
        mylb.font = .systemFont(ofSize: 15)
        mylb.textColor = .black
        return mylb
    }()
    
    private lazy var myChoice: UIImageView = {
        let myImg = UIImageView(frame:CGRect(x: 0, y: 0, width: 17, height: 17))
        myImg.contentMode = .scaleToFill
        myImg.image = UIImage(named: "rock")
        return myImg
    }()
    
    private lazy var myStackImg: UIStackView = { // my label&my image stack
        let stackImg = UIStackView(arrangedSubviews: [myLabel, myChoice])
//        stackImg.widthAnchor.constraint(equalToConstant: 50).isActive = true //너비
        stackImg.axis = .vertical
        stackImg.alignment = .center
        stackImg.distribution = .fillEqually
        stackImg.spacing = 10
        return stackImg
    }()
    
    private lazy var stackImg: UIStackView = { // pc stack&my stack stack
        let stackImg = UIStackView(arrangedSubviews: [pcStackImg, myStackImg])
        stackImg.axis = .horizontal
        stackImg.alignment = .fill
        stackImg.distribution = .fillEqually
        stackImg.spacing = 20
        return stackImg
    }()
    
    private lazy var stackButtonView: UIStackView = {
        let stackBtn = UIStackView(arrangedSubviews: [rockButton, scissorsButton, paperButton])
        stackBtn.axis = .horizontal
        stackBtn.alignment = .fill
        stackBtn.distribution = .fillEqually
        stackBtn.spacing = 5
        return stackBtn
    }()
    
    private lazy var rockButton: UIButton = {
        let rockButton = UIButton(type: .custom)
        rockButton.setImage(UIImage(named: "rock"), for: .normal)
        rockButton.contentVerticalAlignment = .fill
        rockButton.contentHorizontalAlignment = .fill
        rockButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return rockButton
    }()
    
    private lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton(type: .custom)
        scissorsButton.setImage(UIImage(named: "scissors"), for: .normal)
        scissorsButton.contentVerticalAlignment = .fill
        scissorsButton.contentHorizontalAlignment = .fill
        scissorsButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return scissorsButton
    }()
    
    private lazy var paperButton: UIButton = {
        let paperButton = UIButton(type: .custom)
        paperButton.setImage(UIImage(named: "paper"), for: .normal)
        paperButton.contentVerticalAlignment = .fill
        paperButton.contentHorizontalAlignment = .fill
        paperButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return paperButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = .white
        addViews()
        mainLabelConstraints()
        setChoiceImages()
        setButton()
    }
    
    func addViews() {
        view.addSubview(homeLabel)
        view.addSubview(stackImg)
        view.addSubview(stackButtonView)
    }
    
    func mainLabelConstraints() {
        homeLabel.translatesAutoresizingMaskIntoConstraints = false // 오토리사이징x -> 코드로 작성하기 위해서 자동으로
        homeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true //너비
        homeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true // 높이
        homeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true // 상단 위치
        homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func setChoiceImages() {
        stackImg.translatesAutoresizingMaskIntoConstraints = false
        stackImg.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stackImg.heightAnchor.constraint(equalToConstant: 200).isActive = true // 높이
        stackImg.leadingAnchor.constraint(equalTo: homeLabel.leadingAnchor, constant: 20).isActive = true
        stackImg.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 50).isActive = true // 상단 위치
        stackImg.centerXAnchor.constraint(equalTo: homeLabel.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func setButton() {
        stackButtonView.translatesAutoresizingMaskIntoConstraints = false
        stackButtonView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stackButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true // 높이
        stackButtonView.leadingAnchor.constraint(equalTo: stackImg.leadingAnchor).isActive = true
        stackButtonView.topAnchor.constraint(equalTo: stackImg.bottomAnchor, constant: 50).isActive = true // 상단 위치
        stackButtonView.centerXAnchor.constraint(equalTo: stackImg.centerXAnchor).isActive = true // x 중앙 정렬
    }
}
