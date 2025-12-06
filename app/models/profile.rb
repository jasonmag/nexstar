class Profile < ApplicationRecord
  # For highlights list
  def highlights_list
    (highlights || "").split(/\r?\n/).map(&:strip).reject(&:blank?)
  end

  # For toolbox tags
  def toolbox_list
    (toolbox || "").split(",").map(&:strip).reject(&:blank?)
  end

  validates :linkedin_url,
    format: {
      with: /\Ahttps?:\/\/(www\.)?linkedin\.com\/.*\z/i,
      message: "must be a valid LinkedIn URL"
    },
    allow_blank: true

  validates :github_url,
    format: {
      with: /\Ahttps?:\/\/(www\.)?github\.com\/.*\z/i,
      message: "must be a valid GitHub URL"
    },
    allow_blank: true
end
