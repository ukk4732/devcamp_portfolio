module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_default_data 
  end

    def set_default_data
    @page_header = "DevcampPortfolio | My Portfolio blog"
    @meta_data = "DevcampPortfolio Blog Application"
  end
end