require "administrate/base_dashboard"

class ApiTagDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    api: Field::BelongsTo,
    tag: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :api,
    :tag,
    :id,
    :created_at,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :api,
    :tag,
    :id,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :api,
    :tag,
  ]

  # Overwrite this method to customize how api tags are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(api_tag)
  #   "ApiTag ##{api_tag.id}"
  # end
end
