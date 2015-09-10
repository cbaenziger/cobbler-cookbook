if defined?(ChefSpec)
  def import_image(image_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cobbler_image, :import, image_name)
  end

  def import_profile(profile_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cobbler_profile, :import, profile_name)
  end

  def delete_profile(profile_name)
    ChefSpec::Matchers::ResourceMatcher.new(:cobbler_profile, :delete, profile_name)
  end
end
