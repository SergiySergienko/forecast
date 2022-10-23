class SearchValidator < ActiveModel::Validator
  
    def validate(record)
        geo_data = Geocoder.search(record.address, lookup: :google_places_search)
        record.errors.add(:base, "Wrong address") if geo_data.empty?
    end
  
    
  end