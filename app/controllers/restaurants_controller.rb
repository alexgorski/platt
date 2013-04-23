class RestaurantsController < ApplicationController

  def index
    if current_user
    @restaurants = Restaurant.all.sort
    #remove any 2006 rankings so that a proper nymag link can be built

    # something like 
#     /(.*)\.(.*)/.match("what.to.do")[1..2]
# => ["what.to", "do"]
# or perhaps more conventionally,

# s = "what.to.do"

# s.match(/(.*)\.(.*)/)[1..2]
# => ["what.to", "do"]
# u = "wd~50 (4)"
# u.match(/(.*)\((.*)/)[1..4] returns ["wd~50 ","4)"]
    @restaurants.collect! {|r| r.nymag_page.match(/(.*)\((.*)/)[1..4][0]}
    else
      redirect_to new_user_path
    end
  end
  def show  
    @restaurant = Restaurant.find(params[:id])
  end


end
