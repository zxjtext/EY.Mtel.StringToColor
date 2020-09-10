//
//  String+Utils.swift
//  POYA
//
//  Created by mtel on 2020/5/18.
//

import UIKit

public extension String {
	// 计算字符串长度
    func sizeRect(font: UIFont, size: CGSize) -> CGRect {
        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect
    }
	
	func toUIColor() -> UIColor {
		var cString = self.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		let length = (cString as NSString).length
		if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
			return UIColor.white
		}
		if cString.hasPrefix("#"){
			cString = (cString as NSString).substring(from: 1)
		}
		var range = NSRange()
		range.location = 0
		range.length = 2
		let rString = (cString as NSString).substring(with: range)
		range.location = 2
		let gString = (cString as NSString).substring(with: range)
		range.location = 4
		let bString = (cString as NSString).substring(with: range)
		var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
		Scanner(string: rString).scanHexInt32(&r)
		Scanner(string: gString).scanHexInt32(&g)
		Scanner(string: bString).scanHexInt32(&b)
		return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
	}
	
	func validateEnglish() -> Bool {
		let englishRegex = "[a-zA-Z]"
		let regex = try? NSRegularExpression(pattern: englishRegex, options: [])
		if let matches = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count)) {
			return matches.count > 0
		}
		return false
	}
	
	func validateChinese() -> Bool {
		let chiniesRegex = "[\\u4e00-\\u9fa5]"
		let regex = try? NSRegularExpression(pattern: chiniesRegex, options: [])
		if let matches = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count)) {
			return matches.count > 0
		}
		return false
	}
	
	func validateName() -> Bool {
		guard self.count > 0 else {
			return false
		}
		var chineseNum = 0
		var englishNum = 0
		var otherNum = 0
		for c in self {
			let s = String(c)
			if s.validateChinese() {
				chineseNum += 1
			}else if s.validateEnglish(){
				englishNum += 1
			}else {
				otherNum += 1
			}
		}
		if chineseNum > 0 {
			if englishNum > 0 {
				return false
			}
			if otherNum > 0 {
				return false
			}
			if chineseNum > 6 {
				return false
			}
			return true
		}else {
			if englishNum > 0 {
				if otherNum > 0 {
					return false
				}else {
					return true
				}
			}
		}
		return false
	}
	
	func validateTWMobileNumber() -> Bool {
		let mobileNumberRegex = "^(\\+?886\\-?|0)?0?9\\d{8}$"
		let regex = try? NSRegularExpression(pattern: mobileNumberRegex, options: [])
		if let matches = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count)) {
			return matches.count > 0
		}
		return false
	}
	
	func validatedEmail() -> Bool {
        let email = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let regex =  "^[A-Z,a-z,\\d]+([-_.][A-Z,a-z,\\d]+)*@([A-Z,a-z,\\d]+[-.])+[A-Z,a-z,\\d]{2,4}"
        let predicate = NSPredicate(format:"SELF MATCHES %@",regex)
        let result = predicate.evaluate(with: email)
        return result
      
    }
	
	func validatePassword() -> Bool {
		let passwordRegex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$"
		let regex = try? NSRegularExpression(pattern: passwordRegex, options: [])
		if let matches = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count)) {
			return matches.count > 0
		}
		return false
	}
	//2020-09-01  -> 9月1日
	func toCustomDateString() -> String {
		let arr = self.components(separatedBy: "/")
		if arr.count > 2 {
			let month = Int(arr[1])
			let day = Int(arr[2])
			return String(month ?? 1) + "月" + String(day ?? 1) + "日"
		}
		return ""
	}
}
