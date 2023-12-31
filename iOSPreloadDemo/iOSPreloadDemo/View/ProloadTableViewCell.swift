//
//  ProloadTableViewCell.swift
//  PreloadDemo
//
//  Created by leo on 2023/12/2.
//

import UIKit

class ProloadTableViewCell: UITableViewCell {
    private var loadingIndicator: UIActivityIndicatorView?
    private var thumbImageView: UIImageView?
    private var order: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 避免 cell 重用导致数据重叠
        order?.text = ""
        thumbImageView?.image = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        thumbImageView = UIImageView(frame: CGRect(x: (self.frame.size.width - 100)/2, y: 0, width: 100, height: 100))
        self.addSubview(thumbImageView!)
        
        order = UILabel(frame: CGRect(x: 20, y: 0, width: 50, height: self.frame.size.height))
        order?.tintColor = .white
        order?.textAlignment = .center
        order?.textColor = .white
        self.addSubview(order!)
        
        loadingIndicator = UIActivityIndicatorView(frame: self.frame)
        loadingIndicator?.color = .white
        self.addSubview(loadingIndicator!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI(_ image: UIImage?, orderNo: String){
        DispatchQueue.main.async {
            self.displayImage(image: image, orderNo: orderNo)
        }
    }
    
    private func displayImage(image: UIImage?, orderNo: String) {
        if let _image = image {
            thumbImageView?.image = _image
            order?.text = orderNo
            loadingIndicator?.stopAnimating()
        } else {
            loadingIndicator?.startAnimating()
            order?.text = orderNo
            thumbImageView?.image = .none
        }
    }
    
}
