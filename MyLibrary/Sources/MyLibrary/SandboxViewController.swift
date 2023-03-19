//
//  SandboxViewController.swift
//  
//
//  Created by 宗像恒 on 2023/03/18.
//

import UIKit
import TextWithLink

class SandboxViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // テキストを作成する
        let text = "プライバシーポリシーに同意します。"

        // テキストをNSMutableAttributedStringに変換する
        let attributedText = NSMutableAttributedString(string: text)

        // リンクを追加する
        let linkRange = attributedText.mutableString.range(of: "プライバシーポリシーに同意します")
        let linkAttributes: [NSAttributedString.Key: Any] = [.link: URL(string: "https://www.google.co.jp/")!]
        attributedText.addAttributes(linkAttributes, range: linkRange)

        // UILabelに設定する
        let label = UILabel(frame: .init(x: 100, y: 100, width: 100, height: 100))
        label.numberOfLines = 0
        label.attributedText = attributedText
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openLink)))

        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func openLink(sender: UITapGestureRecognizer) {
        guard let url = (sender.view as? UILabel)?.attributedText?.attribute(.link, at: 0, effectiveRange: nil) as? URL else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
        }
}
