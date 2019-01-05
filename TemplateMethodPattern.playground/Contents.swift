import UIKit

protocol Report: class {
    var title: String { get }
    var text: [String] { get }

    init(title: String, text: [String])

    func outputStart()
    func outputHead()
    func outputBodyStart()
    func outputLine(_ line: String)
    func outputBodyEnd()
    func outputEnd()
}

extension Report {
    func outputBody() {
        text.forEach { (text) in
            outputLine(text)
        }
    }

    func outputReport() {
        outputStart()
        outputHead()
        outputBodyStart()
        outputBody()
        outputBodyEnd()
        outputEnd()
    }
}

class HTMLReport: Report {
    private (set) var title: String

    private (set) var text: [String]

    required init(title: String, text: [String]) {
        self.title = title
        self.text = text
    }

    func outputStart() {
        print("<html>")
    }

    func outputHead() {
        print("<head>")
        print("     <title>\(title)</title>")
        print("</head>")
    }

    func outputBodyStart() {
        print("<body>")
    }

    func outputLine(_ line: String) {
        print("     <p>\(line)</p>")
    }

    func outputBodyEnd() {
        print("</body>")
    }

    func outputEnd() {
        print("</html>")
    }
}

class TextReport: Report {
    var title: String

    var text: [String]

    required init(title: String, text: [String]) {
        self.title = title
        self.text = text
    }

    func outputStart() {}

    func outputHead() {
        print("===== \(title) =====")
    }

    func outputBodyStart() {}

    func outputLine(_ line: String) {
        print(line)
    }

    func outputBodyEnd() {}

    func outputEnd() {}

}

let text = ["reporting smth important 1",
            "reporting smth important 2",
            "reporting smth important 3"]
let htmlReport = HTMLReport(title: "This is a great report", text: text)
htmlReport.outputReport()
let textReport = TextReport(title: "This is also a great report", text: text)
textReport.outputReport()

