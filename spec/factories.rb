Factory.define :post do |p|
  #p.id '1'
  p.title 'Test post'
  p.body 'First post content!'
end

Factory.define :admin do |p|
  #p.id '1'
  p.email 'test@test.com'
  p.password '111111'
end

