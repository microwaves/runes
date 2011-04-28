module Runes
  module RubberbandExtension
    def ar_equivalence
      model = _type.gsub(/-/,'/').classify.constantize
      begin
        model.find(id) 
      rescue ActiveRecord::RecordNotFound
        nil
      end
    end
  end
end
