//
//  MainViewController.swift
//  RSPGame
//
//  Created by 박재경 on 2022/09/30.
//

import UIKit

class MainViewController: UIViewController {
    
    var myChoose = Rps(rawValue: Int.random(in: 0...2))
    
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
        rockButton.setTitle("rock", for: .normal)
        rockButton.setImage(UIImage(named: "rock"), for: .normal)
        rockButton.contentVerticalAlignment = .fill
        rockButton.contentHorizontalAlignment = .fill
        rockButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        rockButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        return rockButton
    }()
    
    private lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton(type: .custom)
        scissorsButton.setTitle("scissors", for: .normal)
        scissorsButton.setImage(UIImage(named: "scissors"), for: .normal)
        scissorsButton.contentVerticalAlignment = .fill
        scissorsButton.contentHorizontalAlignment = .fill
        scissorsButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        scissorsButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        return scissorsButton
    }()
    
    private lazy var paperButton: UIButton = {
        let paperButton = UIButton(type: .custom)
        paperButton.setTitle("paper", for: .normal)
        paperButton.setImage(UIImage(named: "paper"), for: .normal)
        paperButton.contentVerticalAlignment = .fill
        paperButton.contentHorizontalAlignment = .fill
        paperButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        paperButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        return paperButton
    }()
    
    private lazy var resultLabel: UILabel = {
        let lb = UILabel()
        lb.text = "결과는?"
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 30)
        lb.textColor = .black
        return lb
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
        setChoiceButton()
        setResultLabel()
    }
    
    func addViews() {
        view.addSubview(homeLabel)
        view.addSubview(stackImg)
        view.addSubview(stackButtonView)
        view.addSubview(resultLabel)
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
    
    func setChoiceButton() {
        stackButtonView.translatesAutoresizingMaskIntoConstraints = false
        stackButtonView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stackButtonView.heightAnchor.constraint(equalToConstant: 100).isActive = true // 높이
        stackButtonView.leadingAnchor.constraint(equalTo: stackImg.leadingAnchor).isActive = true
        stackButtonView.topAnchor.constraint(equalTo: stackImg.bottomAnchor, constant: 50).isActive = true // 상단 위치
        stackButtonView.centerXAnchor.constraint(equalTo: stackImg.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    func setResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: stackButtonView.bottomAnchor, constant: 50).isActive = true // 상단 위치
        resultLabel.centerXAnchor.constraint(equalTo: stackButtonView.centerXAnchor).isActive = true // x 중앙 정렬
    }
    
    @objc func selectButtonTapped(sender:UIButton) {
        let comChoose = Rps(rawValue: Int.random(in: 0...2))
        
        guard let buttonTitle = sender.currentTitle else{ return }
        
        switch buttonTitle {
        case "rock":
            myChoose = Rps(rawValue: 0)
            myChoice.image = UIImage(named: "rock")
            break
        case "scissors":
            myChoose = Rps(rawValue: 2)
            myChoice.image = UIImage(named: "scissors")
            break
        case "paper":
            myChoose = Rps(rawValue: 1)
            myChoice.image = UIImage(named: "paper")
            break
        default:
            break
        }
        
        switch comChoose{
        case .rock:
            pcChoice.image = UIImage(named: "rock.png")
            break
        case .paper:
            pcChoice.image = UIImage(named: "paper.png")
            break
        case .scissors:
            pcChoice.image = UIImage(named: "scissors.png")
            break
            
        case .none:
            break
        }
        
        if comChoose == myChoose {
            resultLabel.text = "비겼다"
        } else if comChoose == .rock && myChoose == .paper {
            resultLabel.text = "이겼다"
        } else if comChoose == .paper && myChoose == .scissors {
            resultLabel.text = "이겼다"
        } else if comChoose == .scissors && myChoose == .rock {
            resultLabel.text = "이겼다"
        } else {
            resultLabel.text = "졌다"
        }
        
    }
}
