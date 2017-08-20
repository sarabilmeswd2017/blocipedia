module ApplicationHelper
  def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?
     content_tag :div, capture(&block), class: css_class
  end

  def can_edit?(wiki)
    true if owns?(wiki) || admin?
  end

  def can_destroy?(wiki)
    true if owns?(wiki) || admin?
  end

  def can_resolve?(wiki)
    true if owns?(wiki) || admin?
  end

  def owns?(wiki)
  true if self.id == wiki.user_id
end

def admin?
  true if self.role_name == :admin
end

def standard?
  true if self.role_name == :standard
end

def premium?
  true if self.role_name == :premium
end

def role_name
  User.user_roles.key(self.role)
end

def self.user_roles
  USER_ROLES
end
end
