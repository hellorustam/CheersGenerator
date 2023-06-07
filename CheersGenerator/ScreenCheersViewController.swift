//
//  ViewController.swift
//  CheersGenerator
//
//  Created by Rustam Samiev on 02.06.2023.
//

import UIKit

final class ScreenCheersViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private var whomLabel: UILabel!
    @IBOutlet private var iWhishLabel: UILabel!
    @IBOutlet private var beAndBecomeLabel: UILabel!
    @IBOutlet private var andLetLabel: UILabel!
    
    @IBOutlet private var wordStatus: UILabel!
    
    @IBOutlet private weak var generateButton: UIButton!
    @IBOutlet private weak var copyButton: UIButton!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyleButton()
    }
        
    // MARK: - Actions
    @IBAction func generateButtonAction() {
        wordStatus.text = "Generator"
        wordStatus.textColor = .black
        
        whomLabel.text = whomPerson.randomElement()
        iWhishLabel.text = iWhish.randomElement()
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
            \(iWhishLabel.text ?? "-")

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

// MARK: - Private Methods
private extension ScreenCheersViewController {
    func setStyleButton() {
        generateButton.layer.cornerRadius = generateButton.frame.width / 2
        copyButton.layer.cornerRadius = copyButton.frame.width / 2
    }
}
