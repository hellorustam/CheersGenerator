//
//  ViewController.swift
//  CheersGenerator
//
//  Created by Rustam Samiev on 02.06.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var whomLabel: UILabel!
    @IBOutlet var iwhishLabel: UILabel!
    @IBOutlet var beAndBecomeLabel: UILabel!
    @IBOutlet var andLetLabel: UILabel!
    
    @IBOutlet var wordStatus: UILabel!
    
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyleButton()
    }
        
    // MARK: - Actions
    @IBAction func generateButtonAction() {
        wordStatus.text = "Generator"
        wordStatus.textColor = .black
        
        whomLabel.text = whomPerson.randomElement()
        iwhishLabel.text = iWhish.randomElement()
        beAndBecomeLabel.text = beAndBecome.randomElement()
        andLetLabel.text = andLet.randomElement()
    }
    
    @IBAction func copyButtonAction() {
        if whomLabel.text == "----" {
            wordStatus.text = "not Copied"
            wordStatus.textColor = .systemRed
        } else {
            UIPasteboard.general.string = """
            Дорогой(ая) именниник(ца)
            \(whomLabel.text ?? "-")

            я желаю
            \(iwhishLabel.text ?? "-")

            будь
            \(beAndBecomeLabel.text ?? "-")

            и пусть
            \(andLetLabel.text ?? "-")
            """
            wordStatus.text = "Copied"
            wordStatus.textColor = .systemGreen
        }
    }
    
}

extension ViewController {
    func setStyleButton() {
        generateButton.layer.cornerRadius = generateButton.frame.width / 2
        copyButton.layer.cornerRadius = copyButton.frame.width / 2
        
//        copyButton.isEnabled = false
    }
}
