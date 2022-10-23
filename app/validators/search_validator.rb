class SearchValidator < ActiveModel::Validator
  
    def validate(record)
        geo_data = Geocoder.search(record.address, lookup: :google_places_search)
        
        # puts "&"*100
        # puts geo_data.inspect
        # puts "&"*100
        # lat_lon = geo_data.first.coordinates
        # place_id = geo_data.first.place_id
        record.errors.add(:base, "Wrong address") if geo_data.empty?
    end
  
    
  end