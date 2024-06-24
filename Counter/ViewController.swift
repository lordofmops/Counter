//
//  ViewController.swift
//  Counter
//
//  Created by Дарья Дробышева on 24.06.2024.
//

import UIKit

class ViewController: UIViewController {
    private var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        changesTextView.isEditable = false
        
        changesTextView.text = "История изменений:"
        changesTextView.font = UIFont.systemFont(ofSize: 20)
        
        counterTextView.text = "Значение счетчика: 0"
        counterTextView.font = UIFont.systemFont(ofSize: 20)
    }

    @IBOutlet weak var increaseButton: UIButton!
    
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var changesTextView: UITextView!
    
    @IBOutlet weak var counterTextView: UILabel!
    
    @IBAction func increaseCounter(_ sender: Any) {
        counter += 1
        let dateTime = currentDateTime()
        changesTextView.text += dateTime + ": значение изменено на +1"
        counterTextView.text = "Значение счетчика: " + counter.description
        changesTextView.scrollTextToBotom()
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        counter -= 1
        let dateTime = currentDateTime()
    
        if (counter < 0) {
            changesTextView.text += dateTime + ": попытка изменения значения на -1"
            changesTextView.text += "\n" + "Значение счетчика не может быть меньше 0"
            counter = 0
        } else {
            changesTextView.text += dateTime + ": значение изменено на -1"
        }
        changesTextView.scrollTextToBotom()
        
        counterTextView.text = "Значение счетчика: " + counter.description
    }
    
    @IBAction func clearCounter(_ sender: Any) {
        counter = 0
        let dateTime = currentDateTime()
        changesTextView.text += dateTime + ": значение сброшено"
        counterTextView.text = "Значение счетчика: " + counter.description
        changesTextView.scrollTextToBotom()
    }
    
    private func currentDateTime() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        return "\n" + dateFormatter.string(from: currentDate)
    }
}

extension UITextView {
    func scrollTextToBotom() {
        let range = NSMakeRange(self.text.count - 1, 1)
        scrollRangeToVisible(range)
    }
}

