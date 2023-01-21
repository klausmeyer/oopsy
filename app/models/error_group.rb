class ErrorGroup < ApplicationRecord
  belongs_to :project
  has_many :grouped_errors, class_name: "Error"

  default_scope { order(id: :desc) }
end
