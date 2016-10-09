#from http://stackoverflow.com/questions/4464050/ruby-objects-and-json-serialization-without-rails
#and modified to provide variable names without '@' and to use JSON.parse vs load
class JSONable
    def to_json
        hash = to_hash
        hash.to_json
    end

    def to_hash
      hash = {}
      self.instance_variables.each do |var|
        clean_name = var.to_s.delete "@"
        obj = self.instance_variable_get var
        if (obj.class < JSONable)
          obj = obj.to_hash
        end
        hash[clean_name] = obj
      end
      hash
    end

    def from_json! string
        JSON.parse(string).each do |var, val|
            self.instance_variable_set "@" + var, val
        end
    end
end
