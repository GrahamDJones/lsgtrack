class Ticket < ActiveRecord::Base
  searcher do
    label :tag, from: :tags, field: :name
    label :state, from: :state, field: :name
  end
  belongs_to :project
  belongs_to :state
  belongs_to :user
  attr_accessible :description, :title, :user, :assets_attributes
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 10}

  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :watchers, join_table: "ticket_watchers", class_name: "User"
  has_many :time_entries

  before_create :set_default_state
  after_create :creator_watches_me

  def tag!(tags)
    self.tags.delete_all
    if tags
      tags = tags.split.uniq.map do |tag|
        Tag.find_or_create_by_name(tag)
      end
      self.tags << tags
    end
  end

  def time_spent_str
    TimeSpent.new(self.time_entries.sum(:duration_minutes))
  end

  private

  def set_default_state
    self.state = TicketState.find_by_default(true)
  end

  def creator_watches_me
    self.watchers << user
  end

end
