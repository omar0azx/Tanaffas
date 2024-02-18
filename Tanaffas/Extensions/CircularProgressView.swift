//
//  CircularProgressView.swift
//  Tanaffas
//
//  Created by omar alzhrani on 08/08/1445 AH.
//

import UIKit

class CircularProgressView: UIView {

    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayers()
    }

    private func setupLayers() {
        // Create track layer
        let trackPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.width / 2, startAngle: -.pi / 2, endAngle: .pi * 2, clockwise: true)
        trackLayer.path = trackPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        layer.addSublayer(trackLayer)

        // Create progress layer
        progressLayer.path = trackPath.cgPath
        progressLayer.strokeColor = UIColor(named: "standr")?.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = 10
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
    }

    func setProgress(_ progress: Float, animated: Bool) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = progress
        animation.duration = animated ? 0.5 : 0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnimation")
        progressLayer.strokeEnd = CGFloat(progress)
    }
}
