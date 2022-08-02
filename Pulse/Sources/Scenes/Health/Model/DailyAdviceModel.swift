//
//  DailyAdviceModel.swift
//  Pulse
//
//  Created by Михаил Багмет on 31.07.2022.
//

import Foundation

final class DailyAdviceModel {
    
    static func createModel() -> [DailyAdvice]? {
        return [
            DailyAdvice(
                title: "Daily Advice",
                description: """
                    You may think all cholesterol is bad, but your body needs some to work right. Cholesterol is a waxy substance that your body makes and \
                    you also get from food. It allows your body to make vitamin D and certain hormones, including estrogen in women and testosterone in \
                    men, and helps with digestion
                    """)
        ]
    }
}
