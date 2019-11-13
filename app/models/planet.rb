class Planet < ApplicationRecord
  alias_attribute :name, :pl_name
  alias_attribute :controversial, :pl_controvflag
end
