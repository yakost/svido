class VisitorsController < ApplicationController
  def index
    @products = Product.limit(8)
  end

end
