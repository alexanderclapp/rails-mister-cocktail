module CocktailsHelper

  def background_photo(cocktail)
    if cocktail.background_photo?
      cl_image_path cocktail.background_photo.path
    else
      'http://fevertree1.d3r-cdn.com/images/default/12274-rls-coppa-tonic-limepreview.jpg'
    end
  end
end
