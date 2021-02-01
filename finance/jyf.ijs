load 'web/gethttp'
load 'convert/pjson'
stock_base_=: 4 : 0             NB. I would make it dyadic so that I could specify the line I wanted displayed
jsonstr =. gethttp 'https://query1.finance.yahoo.com/v7/finance/quote?symbols=',y   
qname=. <x                      NB. Box the x argument to allow imput to search for the line required
dp =. dec_pjson_  jsonstr       NB. Same approach as you
dp =.{. >> {: {.}:{. > }. {. dp NB. Strip off information that I don't need to create a two column table
qname ((= {."1) #  ] )dp        NB. Search the first column of the table for my x argument and return that line as a result
)
