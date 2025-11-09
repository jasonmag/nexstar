class Project < ApplicationRecord
  has_one_attached :thumbnail

  before_save :set_slug

  # Use the slug in URLs instead of the numeric ID
  def to_param
    slug
  end

  private

  def set_slug
    return if name.blank?

    base = name.parameterize
    candidate = base
    counter = 2

    # Ensure uniqueness
    while Project.exists?(slug: candidate) && slug != candidate
      candidate = "#{base}-#{counter}"
      counter += 1
    end

    self.slug = candidate
  end
end
