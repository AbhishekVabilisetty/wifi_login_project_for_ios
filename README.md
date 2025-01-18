# 🚀 Automated Web Login Using WKWebView

This project demonstrates how to automate login attempts to a webpage using `WKWebView` in an iOS app. The app programmatically fills in a username and password, simulating multiple login attempts using variations of a base registration number.

---

## ✨ Features

1. **🔢 Registration Number Variations**:
   - Automatically generates all possible variations of a registration number by replacing digits with superscripts.

2. **🤖 Automated Login**:
   - Simulates filling in the login form and clicking the login button on the webpage.

3. **⚠️ Error Handling**:
   - Logs errors encountered during JavaScript execution or page loading.

4. **🔧 Customizable**:
   - Input your registration number and password for testing purposes.

---

## 🛠️ Installation

1. Clone this repository:
   ```bash
   git clone <repository_url>
   ```

2. Open the project in Xcode.

3. Ensure your app's `Info.plist` allows arbitrary loads for the testing URL:
   ```xml
   <key>NSAppTransportSecurity</key>
   <dict>
       <key>NSAllowsArbitraryLoads</key>
       <true/>
   </dict>
   ```

4. Build and run the app on a simulator or device.

---

## 🎮 Usage

1. **✍️ Modify Credentials**:
   - Open `ViewController.swift` and update the following variables:
     ```swift
     var regNo = "YOUR_REGISTRATION_NUMBER"
     var password = "YOUR_PASSWORD"
     ```

2. **▶️ Run the App**:
   - Launch the app to begin the login automation process. The app attempts to log in using each variation of the registration number.

3. **📜 Monitor Logs**:
   - Check the console output in Xcode to see the progress of login attempts and any errors.

---

## 🔒 Security Considerations

- 🔑 Avoid hardcoding sensitive credentials. Use secure storage mechanisms like Keychain.
- 🛡️ Ensure that JavaScript injected into the webpage does not pose security risks.

---

## 🤖 Acknowledgment

This project was developed with the assistance of AI tools to streamline and enhance the development process.

---

## 📬 Contact

For any questions or suggestions, feel free to contact the repository owner.

