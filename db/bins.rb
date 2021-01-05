@bin = Bin.new

@bin.store_id = Store.first.id

p = "A01-A-"

x = 1
while x >= 100
  if X > 10
    @bin.code = p + "0" + x.to_s
  else
    @bin.code = p + x.to_s
  end
  @bin.desc = @bin.code
  @bin.save
  x = x + 1
end