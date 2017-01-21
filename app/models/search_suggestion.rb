class SearchSuggestion < ApplicationRecord

  def self.terms_for(prefix)
    suggestions = where('term LIKE ?', "#{prefix}_%")
    suggestions.order('popularity desc').limit(10).pluck(:term)
  end

  def self.index_products
    Product.all.each do |product|
      index_term(product.title)
      product.title.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_create.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
