class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates :quantity, presence: true

  belongs_to :supplier
  has_many :images

  def addimage(url)
    image = Image.new({
      url: url,
      product_id: id,
    })
    image.save
  end

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    @tax = price * 0.09
    return @tax
  end

  def total
    total = price + @tax
    return total
  end
end
