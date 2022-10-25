//
//  MainViewController.swift
//  RSPGame
//
//  Created by 박재경 on 2022/09/30.
//

import UIKit

class MainViewController: UIViewController {
    
    var myChoose =ㄷ
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    func addTarget() {
        mainView.paperButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        mainView.scissorsButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        mainView.rockButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
    }
    
    @objc func selectButtonTapped(sender:UIButton) {
        let comChoose = Rps(rawValue: Int.random(in: 0...2))
        
        guard let buttonTitle = sender.currentTitle else{ return }
        
        switch buttonTitle {
        case "rock":
            myChoose = Rps(rawValue: 0)
            mainView.myChoice.image = UIImage(named: "rock")
            break
        case "scissors":
            myChoose = Rps(rawValue: 2)
            mainView.myChoice.image = UIImage(named: "scissors")
            break
        case "paper":
            myChoose = Rps(rawValue: 1)
            mainView.myChoice.image = UIImage(named: "paper")
            break
        default:
            break
        }
        
        switch comChoose{
        case .rock:
            mainView.pcChoice.image = UIImage(named: "rock.png")
            break
        case .paper:
            mainView.pcChoice.image = UIImage(named: "paper.png")
            break
        case .scissors:
            mainView.pcChoice.image = UIImage(named: "scissors.png")
            break
            
        case .none:
            break
        }
        
        if comChoose == myChoose {
            mainView.resultLabel.text = "비겼다"
        } else if comChoose == .rock && myChoose == .paper {
            mainView.resultLabel.text = "이겼다"
        } else if comChoose == .paper && myChoose == .scissors {
            mainView.resultLabel.text = "이겼다"
        } else if comChoose == .scissors && myChoose == .rock {
            mainView.resultLabel.text = "이겼다"
        } else {
            mainView.resultLabel.text = "졌다"
        }
        
    }
}
