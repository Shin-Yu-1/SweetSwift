//
//  MainViewController.swift
//  DiceGame
//
//  Created by 박재경 on 2022/10/11.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var mainView = MainView()
    
    override func loadView() {
        view = mainView
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        addTarget()
    }
    
    func addTarget() {
        mainView.startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func textFieldDelegate() {
        mainView.diceCountText.delegate = self // 위임
    }
    
    func alerFunc() {
        let dialogMessage = UIAlertController(title: "주의", message: "1~3까지의 숫자를 입력해주세요.", preferredStyle: .alert)

        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })

        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        //
        //// Present Alert to
        self.present(dialogMessage, animated: true)
    }
    
    @objc func buttonTapped(sender:UIButton) {
        let imgArr = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

        mainView.diceImg1.image = UIImage(named: imgArr.randomElement()?.description ?? "")
        mainView.diceImg11.image = UIImage(named: imgArr.randomElement()?.description ?? "")
        mainView.diceImg111.image = UIImage(named: imgArr.randomElement()?.description ?? "")
        
        mainView.diceImg2.image = UIImage(named: imgArr.randomElement()?.description ?? "")
        mainView.diceImg22.image = UIImage(named: imgArr.randomElement()?.description ?? "")
        
        mainView.diceImg3.image = UIImage(named: imgArr.randomElement()?.description ?? "")
    }
}

extension MainViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        // make sure the result is under 16 characters
        return updatedText.count <= 40
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let count = textField.text ?? "0"

        
        switch count {
        case "1":
            mainView.addSubview(mainView.diceImg1)
            mainView.diceImg1.image = UIImage(named: "dice1")
            mainView.diceImageConstraints()
            print("1")
            break
        case "2":
            mainView.diceImg1.removeFromSuperview()
            mainView.diceStack3.removeFromSuperview()
            mainView.addSubview(mainView.diceStack2)
            mainView.diceImg11.image = UIImage(named: "dice1")
            mainView.diceImg2.image = UIImage(named: "dice2")
            mainView.diceStack2Constraints()
            print("2")
            break
        case "3":
            mainView.diceImg1.removeFromSuperview()
            mainView.diceStack2.removeFromSuperview()
            mainView.addSubview(mainView.diceStack3)
            mainView.diceImg111.image = UIImage(named: "dice1")
            mainView.diceImg22.image = UIImage(named: "dice2")
            mainView.diceImg3.image = UIImage(named: "dice3")
            mainView.diceStack3Constraints()
            print("3")
            break
        default:
            textField.text = ""
            alerFunc()
        }
        
        return false
    }
    

}

