require "plist"
require "sinatra"
require "open-uri"

@@url = ARGV[0]         # the URL of index.sucatalog

def update
  
  @@products = Array.new  # the array holding all the available updates
  
  begin
    p "Loading catalog from #{@@url}..."
    @@plist = Plist::parse_xml(open(@@url))
    p "#{@@plist['Products'].count} total products found"
  rescue OpenURI::HTTPError
    p "Failed to connect to #{@@url}"
    exit
  end
  
  @@plist['Products'].each do |k, v|
    
		begin
      
      size = 0
      prod = Hash.new
      mdurl = v['ServerMetadataURL'];
			md = Plist::parse_xml(open(mdurl))
      prod['PostDate'] = v['PostDate']
      prod['date'] = v['PostDate'].strftime("%d.%m.%y")
      prod['version'] = md['CFBundleShortVersionString']
      prod['title'] = md['localization']['English']['title']
      
      psize = 0
      v['Packages'].each do |p|
        
        if p['Size'] > psize
          prod['url'] = p['URL']
        end
        
        psize = p['Size']
        size += p['Size']
        
      end
      
      prod['mdurl'] = mdurl
      prod['size'] = size/1024/1024
      @@products.push(prod)
      
		rescue OpenURI::HTTPError, NoMethodError
      # just ignore
		end
    
  end
  
  # sort by date, desc
  @@products = @@products.sort_by { |p| p['PostDate'] }
  @@products.reverse!
  
  @@title = "#{@@products.count} updates in Software Update Depot"
  
end

update()

get "/" do
  
  erb:index
  
end

get "/reload" do
  
  update()
  redirect "/", 303
  
end
