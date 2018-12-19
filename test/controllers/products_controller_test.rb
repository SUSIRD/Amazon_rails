require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end


  test "should create a new product" do
    assert_difference('Product.count') do
      post products_path, params: { product: { name: @product.name, price: @product.price} }
    end
  end

  test "should show product" do
    get products_url(@product)
    assert_response :success
  end

end
