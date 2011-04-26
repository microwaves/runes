module Runes
  module RubberbandExt
    def ar_object
      model = _type.gsub(/-/,'/').classify.constantize
      begin
        model.find(id) 
      rescue ActiveRecord::RecordNotFound
        nil
      end
    end
  end
end
