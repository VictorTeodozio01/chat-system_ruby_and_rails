class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.cached_find(id)
    Rails.cache.fetch("message_#{id}", expires_in: 10.minutes) do
      find(id)
    end
  end
end
