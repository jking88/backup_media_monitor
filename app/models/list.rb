class List < ApplicationRecord
    validates_uniqueness_of :list_name
end
