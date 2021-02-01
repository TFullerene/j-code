NB. Bollinger Bands.
load 'graphics/plot'

sma =: (+/%[)
NB. lower bollinger is two standard deviations lower then the value of the SMA
lowerbol =: 20 sma - 2 * %: +/ (x - -. x)^2 % n 
NB. upper bollinger is two standard deviations above then the value of the SMA
upperbol =: 20 sma + 2 * %: +/ (x - -. x)^2 % n

plot lowerbol upperbol