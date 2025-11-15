class Project < ApplicationRecord
  has_one_attached :thumbnail

  # Generate slug automatically (create & update)
  before_validation :generate_slug

  # Validations
  validates :name, presence: true
  validates :slug,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/ }

  # Use the slug in URLs
  def to_param
    slug
  end

  # Allow admin to regenerate slug on-demand
  def regenerate_slug!
    self.slug = nil
    generate_slug
    save!
  end

  private

  def generate_slug
    return if name.blank?

    base = name.to_s.parameterize

    # If slug manually provided → normalize it
    # Otherwise use base as starting slug
    self.slug = slug.present? ? slug.to_s.parameterize : base

    candidate = slug
    counter = 2

    # Ensure uniqueness (excluding itself)
    while self.class.where.not(id: id).exists?(slug: candidate)
      candidate = "#{base}-#{counter}"
      counter += 1
    end

    self.slug = candidate
  end
end
