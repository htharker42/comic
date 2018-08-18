atom_feed do |feed|
	feed.title "A Porter's Tale"
	feed.updated @comics[0].created_at if @comics.length > 0 

	@comics.each do |comic|
		feed.entry comic do |entry|
			entry.title comic.title 
			entry.content comic.description
			entry.tag!('app:edited', Time.now)
		    entry.author do |author| 
		    	author.name("A Porter's Tale")
		    end 
		end 
	end
end 