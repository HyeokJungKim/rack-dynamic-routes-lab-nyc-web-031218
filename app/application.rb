class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      item = @@songs.find{|i| i.name == item_name}

      if item
        return item.price
      else
        resp.write "Route not found"
        resp.status = 400
      end
    end
  end
end
