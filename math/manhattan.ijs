NB. Manhattan Distance
manhattan =: dyad define
   vector_from_x_to_y =. y - x
   independent_lengths =. | vector_from_x_to_y
   +/ independent_lengths
)
