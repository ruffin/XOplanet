class Planet < ApplicationRecord
  alias_attribute :pl_name, :name
  alias_attribute :pl_controvflag, :controversial
end
