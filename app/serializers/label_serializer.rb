class LabelSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :color, :slug, :user_id

  has_many :tasks
end
