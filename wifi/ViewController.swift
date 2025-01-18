import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var regList: [String] = []
    var regNo = "REGISTRATION_NUMBER" //input your registration number
    var password = "PASSWORD"  //input your password
    var currentAttempt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Generate the list of registration number variations
        regList = genList(regNo: regNo)
        
        // Create and configure the web view
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: self.view.frame, configuration: webConfiguration)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        // Load the URL
        if let url = URL(string: "http://172.18.10.10:1000/logout?") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func genList(regNo: String) -> [String] {
        let superscripts: [Character] = ["⁰", "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹"]
        var variations: [String] = [regNo]
        
        for number in 0..<10 {
            for variation in variations {
                if let index = variation.firstIndex(where: { $0 == Character("\(number)") }) {
                    var newVariation = variation
                    newVariation.replaceSubrange(index...index, with: "\(superscripts[number])")
                    if !variations.contains(newVariation) {
                        variations.append(newVariation)
                    }
                }
            }
        }
        return variations
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard currentAttempt < regList.count else {
            print("All registration numbers attempted.")
            return
        }
        
        let username = regList[currentAttempt]
        currentAttempt += 1
        
        let jsCode = """
        (function() {
            try {
                let usernameField = document.querySelector('#ft_un');
                let passwordField = document.querySelector('#ft_pd');
                let button = document.querySelector('button');
                if (usernameField && passwordField && button) {
                    usernameField.value = '\(username)';
                    passwordField.value = '\(password)';
                    button.click();
                }
            } catch (e) {
                console.error("JavaScript error:", e);
            }
        })();
        """
        
        webView.evaluateJavaScript(jsCode) { (result, error) in
            if let error = error {
                print("JavaScript error: \(error)")
            } else {
                print("Attempted with registration number: \(username)")
            }
        }
    }
}
