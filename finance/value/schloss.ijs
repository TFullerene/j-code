NB. A trading bot, based upon the value investing methods i.e. low P/E, low P/B, used by Walter Schloss.

NB. Get list of items that are Price Book of less than 1

vpb =: #~ pb < 1

NB. Get list of items that are Price to Earnings of 10 or less
vpe =: #~ pe <= 10

NB. Get list of items that are of a value of debt that is low (by Walter Schloss standards, debt is less than the equity), this value can be updated to another percentage, to filter items.
lowdebt =: #~ debttoequity ~: 1.00 

NB. Get all stocks that meet the criteria

(vpb *. vpe *. lowdebt) #~ listofstocks