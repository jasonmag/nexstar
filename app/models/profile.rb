class Profile < ApplicationRecord
  # For highlights list
  def highlights_list
    (highlights || "").split(/\r?\n/).map(&:strip).reject(&:blank?)
  end

  # For toolbox tags
  def toolbox_list
    (toolbox || "").split(",").map(&:strip).reject(&:blank?)
  end
end
