class Article < ApplicationRecord
  has_one_attached :cover

  # Generate slug automatically (create & update)
  before_validation :generate_slug

  validates :title, :content, presence: true
  validates :slug,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/ }

  scope :published, -> {
    where.not(published_at: nil)
      .where("published_at <= ?", Time.current)
      .order(published_at: :desc)
  }

  # Use slug in URLs ( /articles/my-title )
  def to_param
    slug
  end

  # Called from admin to regenerate based on current title
  def regenerate_slug!
    self.slug = nil
    generate_slug
    save!
  end

  private

  def generate_slug
    return if title.blank?

    base = title.to_s.parameterize

    # if slug is blank, start with base; if present, normalize it
    self.slug = slug.present? ? slug.to_s.parameterize : base

    candidate = slug
    n = 2

    # ensure uniqueness (avoid clashes on create/update)
    while self.class.where.not(id: id).exists?(slug: candidate)
      candidate = "#{base}-#{n}"
      n += 1
    end

    self.slug = candidate
  end
end
