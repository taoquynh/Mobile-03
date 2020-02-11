//
//  FakeData.swift
//  QuizApp
//
//  Created by Quynh on 2/10/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import Foundation

func fakeData() -> [Test] {
    // tạo câu hỏi
    let question1 = Question(question: "Việt Nam có bao nhiêu tỉnh thành tính đến năm 2020?",
                             indexRightAnswer: 4,
                             answers: [Answer(answer: "60", isSelected: false),
                                       Answer(answer: "61", isSelected: false),
                                       Answer(answer: "62", isSelected: false),
                                       Answer(answer: "63", isSelected: false)])
    let question2 = Question(question: "Việt Nam có mấy thành phố trực thuộc trung ương?",
                             indexRightAnswer: 2,
                             answers: [Answer(answer: "4", isSelected: false),
                                       Answer(answer: "5", isSelected: false),
                                       Answer(answer: "6", isSelected: false),
                                       Answer(answer: "7", isSelected: false)])
    let question3 = Question(question: "Việt Nam có bao nhiêu dân tộc?",
                             indexRightAnswer: 4,
                             answers: [Answer(answer: "1", isSelected: false),
                                       Answer(answer: "2", isSelected: false),
                                       Answer(answer: "53", isSelected: false),
                                       Answer(answer: "54", isSelected: false)])
    let question4 = Question(question: "Việt Nam có bao nhiêu tỉnh thành ven biển?",
                             indexRightAnswer: 3,
                             answers: [Answer(answer: "26", isSelected: false),
                                       Answer(answer: "27", isSelected: false),
                                       Answer(answer: "28", isSelected: false),
                                       Answer(answer: "29", isSelected: false)])
    let question5 = Question(question: "Việt Nam nằm ở châu lục nào?",
                             indexRightAnswer: 1,
                             answers: [Answer(answer: "Châu Á", isSelected: false),
                                       Answer(answer: "Châu Âu", isSelected: false),
                                       Answer(answer: "Châu Mỹ", isSelected: false),
                                       Answer(answer: "Châu Ấn", isSelected: false)])
    let question6 = Question(question: "An Dương Vương đặt tên nước ta là gì?",
                             indexRightAnswer: 2,
                             answers: [Answer(answer: "Văn Lang", isSelected: false),
                                       Answer(answer: "Âu Lạc", isSelected: false),
                                       Answer(answer: "Đại Cồ Việt", isSelected: false),
                                       Answer(answer: "Đại Ngu", isSelected: false)])
    let question7 = Question(question: "Lý Công Uẩn rời đô từ đâu về Thăng Long?",
                             indexRightAnswer: 3,
                             answers: [Answer(answer: "Quảng Trị", isSelected: false),
                                       Answer(answer: "Cố Đô Huế", isSelected: false),
                                       Answer(answer: "Hoa Lư", isSelected: false),
                                       Answer(answer: "Phú Thọ", isSelected: false)])
    let question8 = Question(question: "Thực dân Pháp đã vu cho vua Nguyễn nào là vua điên?",
                             indexRightAnswer: 1,
                             answers: [Answer(answer: "Vua Thành Thái", isSelected: false),
                                       Answer(answer: "Vua Bảo Đại", isSelected: false),
                                       Answer(answer: "Vua Tự Đức", isSelected: false)])
    let question9 = Question(question: "Chiến dịch Điện Biên Phủ bắt đầu diễn ra vào ngày tháng năm nào?",
                             indexRightAnswer: 4,
                             answers: [Answer(answer: "17/3/1954", isSelected: false),
                                       Answer(answer: "27/4/1954", isSelected: false),
                                       Answer(answer: "30/4/1954", isSelected: false),
                                       Answer(answer: "13/3/1954", isSelected: false)])
    let question10 = Question(question: "Tổng Bí thư đầu tiên của Đảng Cộng sản Việt Nam là ai?",
                              indexRightAnswer: 1,
                              answers: [Answer(answer: "Trần Phú", isSelected: false),
                                        Answer(answer: "Trường Chinh", isSelected: false),
                                        Answer(answer: "Nguyễn Ái Quốc", isSelected: false),
                                        Answer(answer: "Nguyễn Hoan", isSelected: false)])
    
    let question11 = Question(question: "Dịch viêm đường hô hấp cấp do chủng mới của virus CORONA (nCoV) gây ra bắt nguồn từ nước nào?",
                              indexRightAnswer: 2,
                              answers: [Answer(answer: "Ấn Độ", isSelected: false),
                              Answer(answer: "Trung Quốc", isSelected: false),
                              Answer(answer: "Việt Nam", isSelected: false),
                              Answer(answer: "Trung Đông", isSelected: false)])
    
    // tạo bộ đề test
    let test1 = Test(subject: "Địa lý", questions: [question1, question2, question3, question4, question5])
    let test2 = Test(subject: "Lịch sử", questions: [question6, question7, question8, question9, question10])
    let test3 = Test(subject: "Chính trị", questions: [question2, question8, question5, question7, question10])
    let test4 = Test(subject: "Văn hoá", questions: [question2, question9, question1, question7, question6])
    let test5 = Test(subject: "Xã hội", questions: [question10, question3, question5, question4, question9])
    let test6 = Test(subject: "Corona", questions: [question11])
    
    // tạo mảng lưu dữ liệu test
    let tests = [test1, test2, test3, test4, test5, test6]
    
    return tests
}
