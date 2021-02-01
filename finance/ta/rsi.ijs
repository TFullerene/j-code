NB. Relative Strength Index
avg_gain =: >. (+/%[)
avg_loss =: <. (+/%[)
prev_avg_gain =:
current_gain =: NB. Put current gain here 
current_loss =: NB. Put current loss here
rsi1 =: 100 - 100 % 1 + avg_gain % avg_loss
rsi2 =: 100 - 100 % 1 + prev_avg_gain * 13 + current_gain % avg_loss * 13 + current_loss

