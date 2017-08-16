module Jekyll
  module CategoriesFilter
    # Outputs a list of categories as comma-separated <a> links. This is used
    # to output the category list for each post on a category page.
    #
    #  +categories+ is the list of categories to format.
    #
    # Returns string
    #
    def category_list(categories)
      categories.sort.join(", ")
    end
  end
end

Liquid::Template.register_filter(Jekyll::CategoriesFilter)
