 //
//  VenueTableViewCell.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 27/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {
  
  @IBOutlet weak var venueNameLabel: UILabel!
  @IBOutlet weak var venueFullAddressLabel: UILabel!
  @IBOutlet weak var venueCategoryNameLabel: UILabel!
  @IBOutlet weak var venueCheckinNumberLabel: UILabel!
  @IBOutlet weak var categoryIconImageView: UIImageView!
  @IBOutlet weak var containerView: UIView!
  
  let kNullItem = "-"
  
  var venue: Venue? {
    didSet {
      if let venue = venue {
        self.venueNameLabel.text = venue.name ?? kNullItem
        
        if let categories = venue.categories {
          if let category = categories.first {
            self.venueCategoryNameLabel.text = category.name ?? kNullItem
            
            if let icon = category.icon {
              if let iconImageUrl = icon.getCompleteIconImageUrl() {
                self.categoryIconImageView.sd_setImageWithURL(iconImageUrl, placeholderImage: UIImage(named: "categoryPlaceholder"))
              }
            }
          }
        }
        
        if let location = venue.location {
          if let address = location.formattedAddress {
            if address.count > 0 {
              venueFullAddressLabel.text = address.joinWithSeparator(", ")
            }
          }
        }
        
        if let statistics = venue.stats {
          self.venueCheckinNumberLabel.text = String(format: "%d Check-In", statistics.getCheckInNumberFormatted())
        }
        
      }
    }
  }

}
