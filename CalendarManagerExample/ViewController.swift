//
//  ViewController.swift
//  CalendarManagerExample
//
//  Created by 寺田 克彦 on 2019/09/18.
//  Copyright © 2019 moons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var day: UITextField!
    
    @IBAction func pushed(_ sender: Any) {
        if let date = Date(dateString: "\(year.text ?? "2019")-\(month.text ?? "01")-\(day.text ?? "21") 00:00:00", dateFormat: FormatterType.std.rawValue){
            CalendarManager.shared.addEvent(title: "テスト登録", start: date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CalendarManager.shared.authorize { _ in
            _ = CalendarManager.shared.getEvents(from: CalendarManager.shared.getCalendars())
        }
    }
}

