class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
  
def call(env)
  resp1 = Rack::Response.new
  req1 = Rack::Rquest.new(nev)

  if req1.path.match(/cart/)
    @@cart.each do |item|
      resp1.write "@{item}\n"
    end
  elsif req1.path.match(/add/)
    add_term = req1.params["q"]
    resp1.write handle_add(add_term)
  else
    resp1.write "Path Not Found"
  end

  resp.finish
end

def handle_add(add_term)
  if @@items.include?(add_term)
    @@cart << add_term
  else 
    return "We don't have that item"
  end
end

end
