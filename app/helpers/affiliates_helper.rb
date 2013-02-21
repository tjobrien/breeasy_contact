module AffiliatesHelper
  def affiliate_type(master)
    retval = "Standard"
    if master
      retval = "Master"
    end
    return retval
  end
  
  def product_interval(interval)
    retval = "Monthly"
    if interval == 2
      retval = "Annual"
    end
    return retval
  end
end
