//
//  Quiz.swift
//  QuizApp
//
//  Created by Quynh on 2/10/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import Foundation

struct Test {
    // chủ đề câu hỏi
    let subject: String
    // mảng câu hỏi
    var questions: [Question]
}

struct Question {
    // câu hỏi
    let question: String
    // câu trả lời đúng
    let indexRightAnswer: Int
    // mảng câu trả lời
    var answers: [Answer]
}

class Answer {
    // đáp án
    var answer: String = ""
    // check đáp án này có được chọn không
    var isSelected: Bool = false
    
    init(answer: String, isSelected: Bool) {
        self.answer = answer
        self.isSelected = isSelected
    }
}
