# cat1 = Cat.new(name: 'stevelebeve', color: 'black', sex: 'F', birth_date: '2001/09/11', description: 'ugliest cat in ze world')


request1 = CatRentalRequest.new(cat_id: 1, start_date: '2001/09/12', end_date: '2001/09/15', status: 'PENDING')
request2 = CatRentalRequest.new(cat_id: 1, start_date: '2001/09/13', end_date: '2001/09/15')
request3 = CatRentalRequest.new()
request4 = CatRentalRequest.new()