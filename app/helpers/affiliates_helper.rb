module AffiliatesHelper
  def affiliate_type(master)
    retval = "Standard"
    if master
      retval = "Master"
    end
    return retval
  end
end
