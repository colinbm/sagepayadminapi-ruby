class SagePayAdminAPI
  
  VERSION = '0.0.2'
  
  def initialize(vendor, username, password, live=true, sslverify=true)
    @vendor    = vendor
    @username  = username
    @password  = password
    @url       = "https://#{ live ? 'live' : 'test' }.sagepay.com/access/access.htm"
    @sslverify = sslverify
  end
  
  def method_missing(method_id, *arguments)
    
    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    if @sslverify == false
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = 'XML=' + to_xml(method_id, arguments[0])
    
    response = http.request(request)
    
    XmlSimple.xml_in(response.body, { ForceArray: false })
    
  end
  
  private
  
  def to_xml(command, elements={})
    xml = "<command>#{command}</command><vendor>#{@vendor}</vendor><user>#{@username}</user>"
    elements.each do |key, value|
      xml += "<#{key}>#{value}</#{key}>"
    end
    signature = Digest::MD5.hexdigest(xml + "<password>#{@password}</password>")
    xml += "<signature>#{signature}</signature>"
    "<vspaccess>#{xml}</vspaccess>"
  end
   
end
