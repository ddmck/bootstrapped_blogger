class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "Should match confirmation", if: :password
  attr_accessible :title, :body, :article
end
