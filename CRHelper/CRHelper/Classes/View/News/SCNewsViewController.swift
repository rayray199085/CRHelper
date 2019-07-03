//
//  SCNewsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 3/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import WebKit
import SVProgressHUD

class SCNewsViewController: UIViewController {
    private var webView: WKWebView!
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.scrollView.bounces = false
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.isOpaque = false
        webView.backgroundColor = HelperCommon.barColor
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadWebView()
    }
}
private extension SCNewsViewController{
    func setupUI(){
        //        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : HelperCommonValues.SCNaviBarTintColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
    }
    func loadWebView(){
        let urlString = "https://clashroyale.com/blog/news/"
        guard let url = URL(string: urlString) else{
            return
        }
        webView.load(URLRequest(url: url))
    }
}
extension SCNewsViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
    }
}
