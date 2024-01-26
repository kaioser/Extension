//
//  String+Extensions.swift
//  XKExtension
//
//  Created by 杨雄凯 on 2023/3/21.
//

public extension String {
    
    /// url编码
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// 随机字符串
    static var random: String {
        let letters = "0123456789"
        return String((0..<16).map { _ in letters.randomElement()! })
    }
}
