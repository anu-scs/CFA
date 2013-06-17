if Rails.env == "production"
  # set credentials from ENV hash
  #PAYPAL_CREDENTIALS = { :login => ENV['PAYPAL_LOGIN'], :password => ENV['PAYPAL_PASSWORD'], :signature => ENV['PAYPAL_SIGNATURE']}
else
  # test credential
  PAYPAL_CREDENTIALS = { 
    login: "adityanarsapurkar_api1.gmail.com",
    password: "1370633009",
    signature: "An5ns1Kso7MWUdW4ErQKJJJ4qi4-Al7G6KfLkBb2uplCCc4tNVLx1JDi"
  }
end
