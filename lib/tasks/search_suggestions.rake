namespace :search_suggestions do
  desc 'Generate search suggestions form products'
  task index: :environment do
    SearchSuggestion.index_products
  end
end