class State < ActiveRecord::Base
  attr_accessible :background, :color, :name

  default_scope order("\"default\" DESC, name")

  validate :colors_must_differ

  validates :name, presence: true
  validates :background, css_color: true
  validates :color, css_color: true

  def to_s
    name
  end

  def default!
    unset_current_default!
    self.default = true
    self.save!
  end

  private

  def colors_must_differ
    errors.add(:color, "Colors must not be the same") if self.color == self.background
  end
end